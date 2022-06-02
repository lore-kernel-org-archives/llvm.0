Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DDC814
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 13:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654176270; x=1685712270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AhEyDuOP7VunxhmrXHQe2aUa7uelgbYdfi8oLWrqhqg=;
  b=UwjeNTHzPq2gwe9I3tCsbrHOAGUi3/0DLQxYJpEK0HwArlKI+OQ3tgua
   l5EYFhPLX/Av731SajQXb2xe2uNBg6AG+WaOFK5BjQwJ7vk5afIM014zo
   07SIqxKbLEmeCWrfnxQAIWMZEcrPnkBkr8dvgq62mjmCIBscjQYcgR9Up
   7YmVIawkHc2iZgJ04u+XDVuhWfUyr0UGDFz/4Z+9piI+IT15CegDewpqB
   +R/PC7M/dzmU8+PkXOCVtURfRfkX/srJO2/wUXpNXkIL/achfd29KJB5L
   T8aw73d604uRc9nccHShuOyxs5iB6OjKDX3NLBghcrfYbdY8NbMkuZmiG
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="362319305"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="362319305"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 06:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="634047212"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Jun 2022 06:24:28 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwkoN-000577-JQ;
	Thu, 02 Jun 2022 13:24:27 +0000
Date: Thu, 2 Jun 2022 21:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 14545/14705] mm/nommu.c:1081:28: warning:
 variable 'vma' is uninitialized when used here
Message-ID: <202206022121.RYk2Zgc9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2e776ccffa840ce53ee1c21bde54cbe4bc102c3b
commit: 32355b99dd92f9751a482463d7e239fa06302bc9 [14545/14705] mm/nommu: move preallocations and limit other allocations
config: arm-buildonly-randconfig-r004-20220531 (https://download.01.org/0day-ci/archive/20220602/202206022121.RYk2Zgc9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=32355b99dd92f9751a482463d7e239fa06302bc9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 32355b99dd92f9751a482463d7e239fa06302bc9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   mm/nommu.c:593:18: error: incompatible pointer types passing 'struct ma_state **' to parameter of type 'struct ma_state *'; remove & [-Werror,-Wincompatible-pointer-types]
           prev = mas_prev(&mas, 0);
                           ^~~~
   include/linux/maple_tree.h:468:33: note: passing argument to parameter 'mas' here
   void *mas_prev(struct ma_state *mas, unsigned long min);
                                   ^
   mm/nommu.c:594:12: error: incompatible pointer types passing 'struct ma_state **' to parameter of type 'struct ma_state *'; remove & [-Werror,-Wincompatible-pointer-types]
           mas_reset(&mas);
                     ^~~~
   include/linux/maple_tree.h:505:47: note: passing argument to parameter 'mas' here
   static inline void mas_reset(struct ma_state *mas)
                                                 ^
>> mm/nommu.c:1081:28: warning: variable 'vma' is uninitialized when used here [-Wuninitialized]
           if (mas_preallocate(&mas, vma, GFP_KERNEL))
                                     ^~~
   mm/nommu.c:1055:28: note: initialize the variable 'vma' to silence this warning
           struct vm_area_struct *vma;
                                     ^
                                      = NULL
   1 warning and 2 errors generated.


vim +/vma +1081 mm/nommu.c

  1042	
  1043	/*
  1044	 * handle mapping creation for uClinux
  1045	 */
  1046	unsigned long do_mmap(struct file *file,
  1047				unsigned long addr,
  1048				unsigned long len,
  1049				unsigned long prot,
  1050				unsigned long flags,
  1051				unsigned long pgoff,
  1052				unsigned long *populate,
  1053				struct list_head *uf)
  1054	{
  1055		struct vm_area_struct *vma;
  1056		struct vm_region *region;
  1057		struct rb_node *rb;
  1058		vm_flags_t vm_flags;
  1059		unsigned long capabilities, result;
  1060		int ret;
  1061		MA_STATE(mas, &current->mm->mm_mt, 0, 0);
  1062	
  1063		*populate = 0;
  1064	
  1065		/* decide whether we should attempt the mapping, and if so what sort of
  1066		 * mapping */
  1067		ret = validate_mmap_request(file, addr, len, prot, flags, pgoff,
  1068					    &capabilities);
  1069		if (ret < 0)
  1070			return ret;
  1071	
  1072		/* we ignore the address hint */
  1073		addr = 0;
  1074		len = PAGE_ALIGN(len);
  1075	
  1076		/* we've determined that we can make the mapping, now translate what we
  1077		 * now know into VMA flags */
  1078		vm_flags = determine_vm_flags(file, prot, flags, capabilities);
  1079	
  1080	
> 1081		if (mas_preallocate(&mas, vma, GFP_KERNEL))
  1082			goto error_maple_preallocate;
  1083	
  1084		/* we're going to need to record the mapping */
  1085		region = kmem_cache_zalloc(vm_region_jar, GFP_KERNEL);
  1086		if (!region)
  1087			goto error_getting_region;
  1088	
  1089		vma = vm_area_alloc(current->mm);
  1090		if (!vma)
  1091			goto error_getting_vma;
  1092	
  1093		region->vm_usage = 1;
  1094		region->vm_flags = vm_flags;
  1095		region->vm_pgoff = pgoff;
  1096	
  1097		vma->vm_flags = vm_flags;
  1098		vma->vm_pgoff = pgoff;
  1099	
  1100		if (file) {
  1101			region->vm_file = get_file(file);
  1102			vma->vm_file = get_file(file);
  1103		}
  1104	
  1105		down_write(&nommu_region_sem);
  1106	
  1107		/* if we want to share, we need to check for regions created by other
  1108		 * mmap() calls that overlap with our proposed mapping
  1109		 * - we can only share with a superset match on most regular files
  1110		 * - shared mappings on character devices and memory backed files are
  1111		 *   permitted to overlap inexactly as far as we are concerned for in
  1112		 *   these cases, sharing is handled in the driver or filesystem rather
  1113		 *   than here
  1114		 */
  1115		if (vm_flags & VM_MAYSHARE) {
  1116			struct vm_region *pregion;
  1117			unsigned long pglen, rpglen, pgend, rpgend, start;
  1118	
  1119			pglen = (len + PAGE_SIZE - 1) >> PAGE_SHIFT;
  1120			pgend = pgoff + pglen;
  1121	
  1122			for (rb = rb_first(&nommu_region_tree); rb; rb = rb_next(rb)) {
  1123				pregion = rb_entry(rb, struct vm_region, vm_rb);
  1124	
  1125				if (!(pregion->vm_flags & VM_MAYSHARE))
  1126					continue;
  1127	
  1128				/* search for overlapping mappings on the same file */
  1129				if (file_inode(pregion->vm_file) !=
  1130				    file_inode(file))
  1131					continue;
  1132	
  1133				if (pregion->vm_pgoff >= pgend)
  1134					continue;
  1135	
  1136				rpglen = pregion->vm_end - pregion->vm_start;
  1137				rpglen = (rpglen + PAGE_SIZE - 1) >> PAGE_SHIFT;
  1138				rpgend = pregion->vm_pgoff + rpglen;
  1139				if (pgoff >= rpgend)
  1140					continue;
  1141	
  1142				/* handle inexactly overlapping matches between
  1143				 * mappings */
  1144				if ((pregion->vm_pgoff != pgoff || rpglen != pglen) &&
  1145				    !(pgoff >= pregion->vm_pgoff && pgend <= rpgend)) {
  1146					/* new mapping is not a subset of the region */
  1147					if (!(capabilities & NOMMU_MAP_DIRECT))
  1148						goto sharing_violation;
  1149					continue;
  1150				}
  1151	
  1152				/* we've found a region we can share */
  1153				pregion->vm_usage++;
  1154				vma->vm_region = pregion;
  1155				start = pregion->vm_start;
  1156				start += (pgoff - pregion->vm_pgoff) << PAGE_SHIFT;
  1157				vma->vm_start = start;
  1158				vma->vm_end = start + len;
  1159	
  1160				if (pregion->vm_flags & VM_MAPPED_COPY)
  1161					vma->vm_flags |= VM_MAPPED_COPY;
  1162				else {
  1163					ret = do_mmap_shared_file(vma);
  1164					if (ret < 0) {
  1165						vma->vm_region = NULL;
  1166						vma->vm_start = 0;
  1167						vma->vm_end = 0;
  1168						pregion->vm_usage--;
  1169						pregion = NULL;
  1170						goto error_just_free;
  1171					}
  1172				}
  1173				fput(region->vm_file);
  1174				kmem_cache_free(vm_region_jar, region);
  1175				region = pregion;
  1176				result = start;
  1177				goto share;
  1178			}
  1179	
  1180			/* obtain the address at which to make a shared mapping
  1181			 * - this is the hook for quasi-memory character devices to
  1182			 *   tell us the location of a shared mapping
  1183			 */
  1184			if (capabilities & NOMMU_MAP_DIRECT) {
  1185				addr = file->f_op->get_unmapped_area(file, addr, len,
  1186								     pgoff, flags);
  1187				if (IS_ERR_VALUE(addr)) {
  1188					ret = addr;
  1189					if (ret != -ENOSYS)
  1190						goto error_just_free;
  1191	
  1192					/* the driver refused to tell us where to site
  1193					 * the mapping so we'll have to attempt to copy
  1194					 * it */
  1195					ret = -ENODEV;
  1196					if (!(capabilities & NOMMU_MAP_COPY))
  1197						goto error_just_free;
  1198	
  1199					capabilities &= ~NOMMU_MAP_DIRECT;
  1200				} else {
  1201					vma->vm_start = region->vm_start = addr;
  1202					vma->vm_end = region->vm_end = addr + len;
  1203				}
  1204			}
  1205		}
  1206	
  1207		vma->vm_region = region;
  1208	
  1209		/* set up the mapping
  1210		 * - the region is filled in if NOMMU_MAP_DIRECT is still set
  1211		 */
  1212		if (file && vma->vm_flags & VM_SHARED)
  1213			ret = do_mmap_shared_file(vma);
  1214		else
  1215			ret = do_mmap_private(vma, region, len, capabilities);
  1216		if (ret < 0)
  1217			goto error_just_free;
  1218		add_nommu_region(region);
  1219	
  1220		/* clear anonymous mappings that don't ask for uninitialized data */
  1221		if (!vma->vm_file &&
  1222		    (!IS_ENABLED(CONFIG_MMAP_ALLOW_UNINITIALIZED) ||
  1223		     !(flags & MAP_UNINITIALIZED)))
  1224			memset((void *)region->vm_start, 0,
  1225			       region->vm_end - region->vm_start);
  1226	
  1227		/* okay... we have a mapping; now we have to register it */
  1228		result = vma->vm_start;
  1229	
  1230		current->mm->total_vm += len >> PAGE_SHIFT;
  1231	
  1232	share:
  1233		mas_add_vma_to_mm(&mas, current->mm, vma);
  1234	
  1235		/* we flush the region from the icache only when the first executable
  1236		 * mapping of it is made  */
  1237		if (vma->vm_flags & VM_EXEC && !region->vm_icache_flushed) {
  1238			flush_icache_user_range(region->vm_start, region->vm_end);
  1239			region->vm_icache_flushed = true;
  1240		}
  1241	
  1242		up_write(&nommu_region_sem);
  1243	
  1244		return result;
  1245	
  1246	error_just_free:
  1247		up_write(&nommu_region_sem);
  1248	error:
  1249		if (region->vm_file)
  1250			fput(region->vm_file);
  1251		kmem_cache_free(vm_region_jar, region);
  1252		if (vma->vm_file)
  1253			fput(vma->vm_file);
  1254		vm_area_free(vma);
  1255		return ret;
  1256	
  1257	sharing_violation:
  1258		up_write(&nommu_region_sem);
  1259		mas_destroy(&mas);
  1260		pr_warn("Attempt to share mismatched mappings\n");
  1261		ret = -EINVAL;
  1262		goto error;
  1263	
  1264	error_getting_vma:
  1265		mas_destroy(&mas);
  1266		kmem_cache_free(vm_region_jar, region);
  1267		pr_warn("Allocation of vma for %lu byte allocation from process %d failed\n",
  1268				len, current->pid);
  1269		show_free_areas(0, NULL);
  1270		return -ENOMEM;
  1271	
  1272	error_getting_region:
  1273		mas_destroy(&mas);
  1274		pr_warn("Allocation of vm region for %lu byte allocation from process %d failed\n",
  1275				len, current->pid);
  1276		show_free_areas(0, NULL);
  1277		return -ENOMEM;
  1278	
  1279	error_maple_preallocate:
  1280		pr_warn("Allocation of vma tree for process %d failed\n", current->pid);
  1281		show_free_areas(0, NULL);
  1282		return -ENOMEM;
  1283	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
