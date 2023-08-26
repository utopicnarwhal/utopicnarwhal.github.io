'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/assets/videos/responsive_layout.mp4": "c47856e3d67296686f9d2abe52e9410e",
"assets/assets/videos/flutter_developing.mp4": "909b8964f0e5e11075ab4fa3b5d20a7d",
"assets/assets/videos/firebase_hero_loop.webm": "67f734cfedad1b91c1be321af5034499",
"assets/assets/fonts/inter/OFL.txt": "5e95a870c39ff72fe49798801aa14966",
"assets/assets/fonts/inter/Inter-VariableFont_slnt,wght.ttf": "ba8d154465f7fd15e2fc2ced6dceec90",
"assets/assets/fonts/victor_mono/OFL.txt": "d8a15fa1ca345823779a36c0f4e000ed",
"assets/assets/fonts/victor_mono/VictorMono-VariableFont_wght.ttf": "d9882729a56abe1b33f103084e755962",
"assets/assets/images/illustrations/app_deployment.png": "c65466552ceef3ed1010a7fe9ef06b2b",
"assets/assets/images/illustrations/i18n.svg": "a366f143ebceb6f1718c2efe404749c8",
"assets/assets/images/illustrations/design_system.png": "c0fe600721adfe84835fde991ba817d1",
"assets/assets/images/illustrations/material_design.png": "0f730ae00a1c7e792d4a75467b8ae0d2",
"assets/assets/images/illustrations/version_control.svg": "a07d5b0bd062bfb0f9673cc51de3b204",
"assets/assets/images/illustrations/cicd.png": "856e5a497aff06a7273b2f5dc5528f92",
"assets/assets/images/illustrations/dart_aot_compile.svg": "8239186c0a04aa4b589ef04c90342150",
"assets/assets/images/third_party/google_material_design_logo.svg": "65f488564a1c551f0a472501dfdca50c",
"assets/assets/images/third_party/freska-customer-app-icon.svg": "8cb3da11978e6b55bc402c745dae75bc",
"assets/assets/images/third_party/firebase_logomark.svg": "14cc68517cdcaf8d16e4f3548b8b8ade",
"assets/assets/images/third_party/freska-service-workers-app-icon.svg": "771dac87591198fc8bc072e9eb8fdfea",
"assets/assets/images/third_party/github_actions_logomark.svg": "22caf3cddb17ae4a5ff78bfc5cf73ad1",
"assets/assets/images/third_party/github_icon.svg": "7d4ce2265e7e6188d2dee0dc17d4e184",
"assets/assets/images/third_party/logo_dart.svg": "dec70fbc0660480ee8528f8c0dec53b7",
"assets/assets/images/third_party/freska-f-icon.svg": "9cea0969b5ecbcf295adf7f909ad9f25",
"assets/assets/images/third_party/git_logomark.svg": "ac1605a5c813f0b37079ca2417cbd892",
"assets/assets/animations/under_construction.riv": "4dddc09c05a1765c6b82b3cfadc59ff5",
"assets/assets/animations/utopic_narwhal.riv": "4a640612839c3dadd84272fd37af1f51",
"assets/fonts/MaterialIcons-Regular.otf": "3ac7c083e10b9110661f789de03d6ce7",
"assets/AssetManifest.json": "34d8ff16e09632fb8231c02d4e74f620",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "56dd5693c5d4a224ab750ef61be7753a",
"assets/FontManifest.json": "4b9ed03dbf2ca5482a424c7237c17cf9",
"assets/NOTICES": "c39b551c18cc049fc391e3e99564f910",
"version.json": "0325640b78b9f97959290dc5ebb8b3ed",
"sergei_danilov_CV.pdf": "818fe65fa81e2becc34c2cd9688fb37f",
"favicon.ico": "ac8178f234f81e3fabf528597e8d68cd",
"manifest.json": "2c4ff76aea7ee368a483c1fc00cbb878",
"index.html": "002f681a66193025cef71b2fad32b8a6",
"/": "002f681a66193025cef71b2fad32b8a6",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"icons/android-chrome-512x512.png": "0f18592faa1111220c10de0e397d256d",
"icons/android-chrome-192x192.png": "01961163e73ae7a9f096788123ca32f4",
"icons/apple-touch-icon.png": "1a975f1527932a16f4d79400aeade2a0",
"icons/safari-pinned-tab.svg": "0dc2a8ae55f02fcee443a1c32c47dc1f",
"favicon.svg": "b9f98ed26ab090feb23089feb4f29457",
"main.dart.js": "6774783177cee1d6fce11d190964dbda",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9"};
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
