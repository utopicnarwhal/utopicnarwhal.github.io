'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"favicon.ico": "ac8178f234f81e3fabf528597e8d68cd",
"sergei_danilov_CV.pdf": "818fe65fa81e2becc34c2cd9688fb37f",
"icons/apple-touch-icon.png": "1a975f1527932a16f4d79400aeade2a0",
"icons/safari-pinned-tab.svg": "0dc2a8ae55f02fcee443a1c32c47dc1f",
"icons/android-chrome-512x512.png": "0f18592faa1111220c10de0e397d256d",
"icons/android-chrome-192x192.png": "01961163e73ae7a9f096788123ca32f4",
"index.html": "2e1e10086413f853c268c3e9f50d570e",
"/": "2e1e10086413f853c268c3e9f50d570e",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"manifest.json": "2c4ff76aea7ee368a483c1fc00cbb878",
"assets/fonts/MaterialIcons-Regular.otf": "7ceb4d0c425b8b183d0a2375d08e9644",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "188252f347374a46e07ea4c82d6343be",
"assets/assets/images/third_party/github-icon.svg": "7d4ce2265e7e6188d2dee0dc17d4e184",
"assets/assets/images/third_party/freska-f-icon.svg": "9cea0969b5ecbcf295adf7f909ad9f25",
"assets/assets/images/third_party/freska-customer-app-icon.svg": "8cb3da11978e6b55bc402c745dae75bc",
"assets/assets/images/third_party/freska-service-workers-app-icon.svg": "771dac87591198fc8bc072e9eb8fdfea",
"assets/assets/fonts/victor_mono/VictorMono-Italic-VariableFont_wght.ttf": "4a49140ef1b0ac967c043d6d1b735790",
"assets/assets/fonts/victor_mono/OFL.txt": "d8a15fa1ca345823779a36c0f4e000ed",
"assets/assets/fonts/victor_mono/VictorMono-VariableFont_wght.ttf": "d9882729a56abe1b33f103084e755962",
"assets/assets/fonts/inter/OFL.txt": "5e95a870c39ff72fe49798801aa14966",
"assets/assets/fonts/inter/Inter-VariableFont_slnt,wght.ttf": "ba8d154465f7fd15e2fc2ced6dceec90",
"assets/assets/animations/under_construction.riv": "4dddc09c05a1765c6b82b3cfadc59ff5",
"assets/AssetManifest.json": "5b991cf0993193975598c6fabfe39b9d",
"assets/NOTICES": "2e1e8cdb7b54b1ae25730714553d1ef3",
"assets/FontManifest.json": "430ab98fbfcd8bfb6a5f01d188f3a97b",
"version.json": "0325640b78b9f97959290dc5ebb8b3ed",
"main.dart.js": "20e9d85cf489c3e5931dedc3cfe1dd71",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"favicon.svg": "b9f98ed26ab090feb23089feb4f29457"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
