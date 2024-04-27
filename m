Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20073C062;
	Sat, 27 Apr 2024 04:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714192108; cv=none; b=V701o+XlQlWEt1GoxfySKN5lWd3CE99ZYbCtsSuK3pX4zYmxpweos9040LyGftZgmJgf9TJmGs9CBAo70o+n3fXME2V//ghBqLltAp6NA64XmbpMN3PMlVTzs6cIStEJ2J4/aAqzX8Y9Ub7ytSxC1HnITpazwFnYRvufwhLPJNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714192108; c=relaxed/simple;
	bh=TwmBAIgx1d69s5D9g55JjJWgfN8jIQXYktribH0icS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ODPfEIgE/fLvZdbzFJKryVClxo9kYnzizfw12Ocyz17lAFiXPrYEnybA/go0gY7cCt+XUC6gzkEKCazynwD5CKFCxMfoWCjcS/qR1cGNRbvR1ljsLfkwPN/LcAbud2WzC9TnbRwp5VnYCt/xXfzjj/iL5ZhcoCe1By/nHR43PPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8BS1RA5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8BS1RA5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714192105; x=1745728105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TwmBAIgx1d69s5D9g55JjJWgfN8jIQXYktribH0icS0=;
  b=E8BS1RA5PL3asEZ2xS4NDSBZkD1iWYs/qygFOur04iQs4R73nDn2lc94
   TPZg72if9rrDt8zRSGVTqJqOiGIDooz/pyq2b1eyZ7/d/4ewJs1lvgLtr
   FiijQccdEW3br1Oj6LFqyIFaoK6cqd4OobqXxc3h1Nr8Ck186nq+r+oUR
   SXAakyujRlYVxL0P2hjt3M0g4e2ErAZS1su61Un8O0sireJkjTxMPxAyl
   13txrUp3s5qU3JxXzvwEdfntYVteMvLWdzEiAlOIwYkDahQBXY2HyDS4h
   D6AlU7tw3PPhAaGi2Rir6wyJy0PKdyJinNlKhG+DW8xIu2r7aPHL4yNY9
   w==;
X-CSE-ConnectionGUID: fc8T7vytRYW0IAlCBOSpVg==
X-CSE-MsgGUID: ffLgTz2TQTCNJOEoY9DgGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9861521"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="9861521"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 21:28:25 -0700
X-CSE-ConnectionGUID: JHTyLJMQQeGbaE11OOgrtw==
X-CSE-MsgGUID: dc8xYRhqQ4unqIe5VFJBJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="25690117"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Apr 2024 21:28:23 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0Zfh-0004ec-0G;
	Sat, 27 Apr 2024 04:28:21 +0000
Date: Sat, 27 Apr 2024 12:28:11 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:for-linux-next 1/1]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1267:3: error: label at end
 of compound statement is a C23 extension
Message-ID: <202404271259.VQcFccxo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   61ba791c4a7a09a370c45b70a81b8c7d4cf6b2ae
commit: b58a0bc904ffa091fc020f7fd00e91808fec820e [1/1] nouveau: add command-line GSP-RM registry support
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240427/202404271259.VQcFccxo-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271259.VQcFccxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271259.VQcFccxo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1267:3: error: label at end of compound statement is a C23 extension [-Werror,-Wc23-extensions]
    1267 |                 }
         |                 ^
   6 errors generated.


vim +1267 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

  1199	
  1200	/**
  1201	 * build_registry -- create the registry RPC data
  1202	 * @gsp: gsp pointer
  1203	 * @registry: pointer to the RPC payload to fill
  1204	 *
  1205	 * After all registry key/value pairs have been added, call this function to
  1206	 * build the RPC.
  1207	 *
  1208	 * The registry RPC looks like this:
  1209	 *
  1210	 * +-----------------+
  1211	 * |NvU32 size;      |
  1212	 * |NvU32 numEntries;|
  1213	 * +-----------------+
  1214	 * +----------------------------------------+
  1215	 * |PACKED_REGISTRY_ENTRY                   |
  1216	 * +----------------------------------------+
  1217	 * |Null-terminated key (string) for entry 0|
  1218	 * +----------------------------------------+
  1219	 * |Binary/string data value for entry 0    | (only if necessary)
  1220	 * +----------------------------------------+
  1221	 *
  1222	 * +----------------------------------------+
  1223	 * |PACKED_REGISTRY_ENTRY                   |
  1224	 * +----------------------------------------+
  1225	 * |Null-terminated key (string) for entry 1|
  1226	 * +----------------------------------------+
  1227	 * |Binary/string data value for entry 1    | (only if necessary)
  1228	 * +----------------------------------------+
  1229	 * ... (and so on, one copy for each entry)
  1230	 *
  1231	 *
  1232	 * The 'data' field of an entry is either a 32-bit integer (for type DWORD)
  1233	 * or an offset into the PACKED_REGISTRY_TABLE (for types BINARY and STRING).
  1234	 *
  1235	 * All memory allocated by add_registry() is released.
  1236	 */
  1237	static void build_registry(struct nvkm_gsp *gsp, PACKED_REGISTRY_TABLE *registry)
  1238	{
  1239		struct registry_list_entry *reg, *n;
  1240		size_t str_offset;
  1241		unsigned int i = 0;
  1242	
  1243		registry->numEntries = list_count_nodes(&gsp->registry_list);
  1244		str_offset = struct_size(registry, entries, registry->numEntries);
  1245	
  1246		list_for_each_entry_safe(reg, n, &gsp->registry_list, head) {
  1247			registry->entries[i].type = reg->type;
  1248			registry->entries[i].length = reg->vlen;
  1249	
  1250			/* Append the key name to the table */
  1251			registry->entries[i].nameOffset = str_offset;
  1252			memcpy((void *)registry + str_offset, reg->key, reg->klen);
  1253			str_offset += reg->klen;
  1254	
  1255			switch (reg->type) {
  1256			case REGISTRY_TABLE_ENTRY_TYPE_DWORD:
  1257				registry->entries[i].data = reg->dword;
  1258				break;
  1259			case REGISTRY_TABLE_ENTRY_TYPE_BINARY:
  1260			case REGISTRY_TABLE_ENTRY_TYPE_STRING:
  1261				/* If the type is binary or string, also append the value */
  1262				memcpy((void *)registry + str_offset, reg->binary, reg->vlen);
  1263				registry->entries[i].data = str_offset;
  1264				str_offset += reg->vlen;
  1265				break;
  1266			default:
> 1267			}
  1268	
  1269			i++;
  1270			list_del(&reg->head);
  1271			kfree(reg);
  1272		}
  1273	
  1274		/* Double-check that we calculated the sizes correctly */
  1275		WARN_ON(gsp->registry_rpc_size != str_offset);
  1276	
  1277		registry->size = gsp->registry_rpc_size;
  1278	}
  1279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
