Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B73F2FE57F;
	Thu, 18 Sep 2025 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758191215; cv=none; b=a6N6dyDg1DvqMfmpbHyFWE18vRzP4aKBfmpXPyZzhzSsEWKB/QkkkYH4WhZWAqjnF6M2V3JgkaMsBlZjvylIFWdkhshH0O9ZcALXM21ZOlk3AUT7wWMPSr09bfJewdKtGUSrUg2zSw6yW70u9anuTnulYjv5RSZiYWyC3Ds9BW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758191215; c=relaxed/simple;
	bh=62sjeasn+6fksAwX4jc6Dmvo+ua46yWEBj6K0EjZjtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lYQEuEFp2hkQNwoMNUH4mIHVeYNhRJCjTjXRe3vrJu9qy4tlmR/ykk8Gp7IvOsi4hT/j/WUFOOqs8CMZfMW7eAFJto8I5yY3HMckdTSe7Y+aGupZKfTfiN1YMDcGwJuqkr4J0atQQ/B+cBMr4Bk3PMxAb6ujPoLVBzcSy8Ece8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbm+YZOs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbm+YZOs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758191212; x=1789727212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=62sjeasn+6fksAwX4jc6Dmvo+ua46yWEBj6K0EjZjtk=;
  b=hbm+YZOsj8mhNhQJqHiuby0G1iOy3ZnZcPEpFFJTm2/IvcQh3+Ez569a
   WL1LGfrzAAx8ePohkrr7siFRZC1D7br9oGYzQ3C0Rh3Nll8qsUL2qWKLg
   v/l4TRZm7RsfYOKxsasNe/9USwYxgkcIOUJpmDXVlBbXP+69zuTETjJlx
   BMc4RiYxPkiAmZ8N6mOON8qJ3m2ImK2R0KahFr3Bwqa2Qfxjl6Y+Iz7gj
   FWtGE9Kz0Sqz52Bzx/5QaUdo/hwNoeMG5AHkdd9k1p7Rj4aqga6Njga+A
   noRwRSLFk3X7Bp4svNUTb92++mrPx8GUMA169C3IJBDqU1SERaJCctJPm
   g==;
X-CSE-ConnectionGUID: PwxqG/+vR56BXofPIwEUHw==
X-CSE-MsgGUID: TiTiSB3KSiWIzUmtys44Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71943905"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="71943905"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 03:26:49 -0700
X-CSE-ConnectionGUID: vsF+OoVySqWUJqYGdsVTLA==
X-CSE-MsgGUID: CMDa6H/cQciNTO+ouRpcJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="212653181"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Sep 2025 03:26:47 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzBqe-00037H-0H;
	Thu, 18 Sep 2025 10:26:44 +0000
Date: Thu, 18 Sep 2025 18:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Zheng Yu <zheng.yu@northwestern.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: [kleikamp-shaggy:jfs-next 1/5] fs/jfs/jfs_dtree.c:2906:31: warning:
 result of comparison of constant 128 with expression of type 's8' (aka
 'signed char') is always false
Message-ID: <202509181832.frk03WjF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kleikamp/linux-shaggy jfs-next
head:   c87ed72ff7cfd52843fef97be14567e2d377f584
commit: 79e48b88ffd89a4446f407680ab4e7e5679a04e8 [1/5] jfs: replace hardcoded magic number with DTPAGEMAXSLOT constant
config: arm-randconfig-001-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181832.frk03WjF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181832.frk03WjF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181832.frk03WjF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/jfs/jfs_dtree.c:2906:31: warning: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
    2906 |                         if (stbl[i] < 0 || stbl[i] > DTPAGEMAXSLOT) {
         |                                            ~~~~~~~ ^ ~~~~~~~~~~~~~
   fs/jfs/jfs_dtree.c:3111:30: warning: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
    3111 |                 if (stbl[0] < 0 || stbl[0] > DTPAGEMAXSLOT) {
         |                                    ~~~~~~~ ^ ~~~~~~~~~~~~~
   2 warnings generated.


vim +2906 fs/jfs/jfs_dtree.c

  2702	
  2703	/*
  2704	 *	jfs_readdir()
  2705	 *
  2706	 * function: read directory entries sequentially
  2707	 *	from the specified entry offset
  2708	 *
  2709	 * parameter:
  2710	 *
  2711	 * return: offset = (pn, index) of start entry
  2712	 *	of next jfs_readdir()/dtRead()
  2713	 */
  2714	int jfs_readdir(struct file *file, struct dir_context *ctx)
  2715	{
  2716		struct inode *ip = file_inode(file);
  2717		struct nls_table *codepage = JFS_SBI(ip->i_sb)->nls_tab;
  2718		int rc = 0;
  2719		loff_t dtpos;	/* legacy OS/2 style position */
  2720		struct dtoffset {
  2721			s16 pn;
  2722			s16 index;
  2723			s32 unused;
  2724		} *dtoffset = (struct dtoffset *) &dtpos;
  2725		s64 bn;
  2726		struct metapage *mp;
  2727		dtpage_t *p;
  2728		int index;
  2729		s8 *stbl;
  2730		struct btstack btstack;
  2731		int i, next;
  2732		struct ldtentry *d;
  2733		struct dtslot *t;
  2734		int d_namleft, len, outlen;
  2735		unsigned long dirent_buf;
  2736		char *name_ptr;
  2737		u32 dir_index;
  2738		int do_index = 0;
  2739		uint loop_count = 0;
  2740		struct jfs_dirent *jfs_dirent;
  2741		int jfs_dirents;
  2742		int overflow, fix_page, page_fixed = 0;
  2743		static int unique_pos = 2;	/* If we can't fix broken index */
  2744	
  2745		if (ctx->pos == DIREND)
  2746			return 0;
  2747	
  2748		if (DO_INDEX(ip)) {
  2749			/*
  2750			 * persistent index is stored in directory entries.
  2751			 * Special cases:	 0 = .
  2752			 *			 1 = ..
  2753			 *			-1 = End of directory
  2754			 */
  2755			do_index = 1;
  2756	
  2757			dir_index = (u32) ctx->pos;
  2758	
  2759			/*
  2760			 * NFSv4 reserves cookies 1 and 2 for . and .. so the value
  2761			 * we return to the vfs is one greater than the one we use
  2762			 * internally.
  2763			 */
  2764			if (dir_index)
  2765				dir_index--;
  2766	
  2767			if (dir_index > 1) {
  2768				struct dir_table_slot dirtab_slot;
  2769	
  2770				if (dtEmpty(ip) ||
  2771				    (dir_index >= JFS_IP(ip)->next_index)) {
  2772					/* Stale position.  Directory has shrunk */
  2773					ctx->pos = DIREND;
  2774					return 0;
  2775				}
  2776			      repeat:
  2777				rc = read_index(ip, dir_index, &dirtab_slot);
  2778				if (rc) {
  2779					ctx->pos = DIREND;
  2780					return rc;
  2781				}
  2782				if (dirtab_slot.flag == DIR_INDEX_FREE) {
  2783					if (loop_count++ > JFS_IP(ip)->next_index) {
  2784						jfs_err("jfs_readdir detected infinite loop!");
  2785						ctx->pos = DIREND;
  2786						return 0;
  2787					}
  2788					dir_index = le32_to_cpu(dirtab_slot.addr2);
  2789					if (dir_index == -1) {
  2790						ctx->pos = DIREND;
  2791						return 0;
  2792					}
  2793					goto repeat;
  2794				}
  2795				bn = addressDTS(&dirtab_slot);
  2796				index = dirtab_slot.slot;
  2797				DT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
  2798				if (rc) {
  2799					ctx->pos = DIREND;
  2800					return 0;
  2801				}
  2802				if (p->header.flag & BT_INTERNAL) {
  2803					jfs_err("jfs_readdir: bad index table");
  2804					DT_PUTPAGE(mp);
  2805					ctx->pos = DIREND;
  2806					return 0;
  2807				}
  2808			} else {
  2809				if (dir_index == 0) {
  2810					/*
  2811					 * self "."
  2812					 */
  2813					ctx->pos = 1;
  2814					if (!dir_emit(ctx, ".", 1, ip->i_ino, DT_DIR))
  2815						return 0;
  2816				}
  2817				/*
  2818				 * parent ".."
  2819				 */
  2820				ctx->pos = 2;
  2821				if (!dir_emit(ctx, "..", 2, PARENT(ip), DT_DIR))
  2822					return 0;
  2823	
  2824				/*
  2825				 * Find first entry of left-most leaf
  2826				 */
  2827				if (dtEmpty(ip)) {
  2828					ctx->pos = DIREND;
  2829					return 0;
  2830				}
  2831	
  2832				if ((rc = dtReadFirst(ip, &btstack)))
  2833					return rc;
  2834	
  2835				DT_GETSEARCH(ip, btstack.top, bn, mp, p, index);
  2836			}
  2837		} else {
  2838			/*
  2839			 * Legacy filesystem - OS/2 & Linux JFS < 0.3.6
  2840			 *
  2841			 * pn = 0; index = 1:	First entry "."
  2842			 * pn = 0; index = 2:	Second entry ".."
  2843			 * pn > 0:		Real entries, pn=1 -> leftmost page
  2844			 * pn = index = -1:	No more entries
  2845			 */
  2846			dtpos = ctx->pos;
  2847			if (dtpos < 2) {
  2848				/* build "." entry */
  2849				ctx->pos = 1;
  2850				if (!dir_emit(ctx, ".", 1, ip->i_ino, DT_DIR))
  2851					return 0;
  2852				dtoffset->index = 2;
  2853				ctx->pos = dtpos;
  2854			}
  2855	
  2856			if (dtoffset->pn == 0) {
  2857				if (dtoffset->index == 2) {
  2858					/* build ".." entry */
  2859					if (!dir_emit(ctx, "..", 2, PARENT(ip), DT_DIR))
  2860						return 0;
  2861				} else {
  2862					jfs_err("jfs_readdir called with invalid offset!");
  2863				}
  2864				dtoffset->pn = 1;
  2865				dtoffset->index = 0;
  2866				ctx->pos = dtpos;
  2867			}
  2868	
  2869			if (dtEmpty(ip)) {
  2870				ctx->pos = DIREND;
  2871				return 0;
  2872			}
  2873	
  2874			if ((rc = dtReadNext(ip, &ctx->pos, &btstack))) {
  2875				jfs_err("jfs_readdir: unexpected rc = %d from dtReadNext",
  2876					rc);
  2877				ctx->pos = DIREND;
  2878				return 0;
  2879			}
  2880			/* get start leaf page and index */
  2881			DT_GETSEARCH(ip, btstack.top, bn, mp, p, index);
  2882	
  2883			/* offset beyond directory eof ? */
  2884			if (bn < 0) {
  2885				ctx->pos = DIREND;
  2886				return 0;
  2887			}
  2888		}
  2889	
  2890		dirent_buf = __get_free_page(GFP_KERNEL);
  2891		if (dirent_buf == 0) {
  2892			DT_PUTPAGE(mp);
  2893			jfs_warn("jfs_readdir: __get_free_page failed!");
  2894			ctx->pos = DIREND;
  2895			return -ENOMEM;
  2896		}
  2897	
  2898		while (1) {
  2899			jfs_dirent = (struct jfs_dirent *) dirent_buf;
  2900			jfs_dirents = 0;
  2901			overflow = fix_page = 0;
  2902	
  2903			stbl = DT_GETSTBL(p);
  2904	
  2905			for (i = index; i < p->header.nextindex; i++) {
> 2906				if (stbl[i] < 0 || stbl[i] > DTPAGEMAXSLOT) {
  2907					jfs_err("JFS: Invalid stbl[%d] = %d for inode %ld, block = %lld",
  2908						i, stbl[i], (long)ip->i_ino, (long long)bn);
  2909					free_page(dirent_buf);
  2910					DT_PUTPAGE(mp);
  2911					return -EIO;
  2912				}
  2913	
  2914				d = (struct ldtentry *) & p->slot[stbl[i]];
  2915	
  2916				if (((long) jfs_dirent + d->namlen + 1) >
  2917				    (dirent_buf + PAGE_SIZE)) {
  2918					/* DBCS codepages could overrun dirent_buf */
  2919					index = i;
  2920					overflow = 1;
  2921					break;
  2922				}
  2923	
  2924				d_namleft = d->namlen;
  2925				name_ptr = jfs_dirent->name;
  2926				jfs_dirent->ino = le32_to_cpu(d->inumber);
  2927	
  2928				if (do_index) {
  2929					len = min(d_namleft, DTLHDRDATALEN);
  2930					jfs_dirent->position = le32_to_cpu(d->index);
  2931					/*
  2932					 * d->index should always be valid, but it
  2933					 * isn't.  fsck.jfs doesn't create the
  2934					 * directory index for the lost+found
  2935					 * directory.  Rather than let it go,
  2936					 * we can try to fix it.
  2937					 */
  2938					if ((jfs_dirent->position < 2) ||
  2939					    (jfs_dirent->position >=
  2940					     JFS_IP(ip)->next_index)) {
  2941						if (!page_fixed && !isReadOnly(ip)) {
  2942							fix_page = 1;
  2943							/*
  2944							 * setting overflow and setting
  2945							 * index to i will cause the
  2946							 * same page to be processed
  2947							 * again starting here
  2948							 */
  2949							overflow = 1;
  2950							index = i;
  2951							break;
  2952						}
  2953						jfs_dirent->position = unique_pos++;
  2954					}
  2955					/*
  2956					 * We add 1 to the index because we may
  2957					 * use a value of 2 internally, and NFSv4
  2958					 * doesn't like that.
  2959					 */
  2960					jfs_dirent->position++;
  2961				} else {
  2962					jfs_dirent->position = dtpos;
  2963					len = min(d_namleft, DTLHDRDATALEN_LEGACY);
  2964				}
  2965	
  2966				/* copy the name of head/only segment */
  2967				outlen = jfs_strfromUCS_le(name_ptr, d->name, len,
  2968							   codepage);
  2969				jfs_dirent->name_len = outlen;
  2970	
  2971				/* copy name in the additional segment(s) */
  2972				next = d->next;
  2973				while (next >= 0) {
  2974					t = (struct dtslot *) & p->slot[next];
  2975					name_ptr += outlen;
  2976					d_namleft -= len;
  2977					/* Sanity Check */
  2978					if (d_namleft == 0) {
  2979						jfs_error(ip->i_sb,
  2980							  "JFS:Dtree error: ino = %ld, bn=%lld, index = %d\n",
  2981							  (long)ip->i_ino,
  2982							  (long long)bn,
  2983							  i);
  2984						goto skip_one;
  2985					}
  2986					len = min(d_namleft, DTSLOTDATALEN);
  2987					outlen = jfs_strfromUCS_le(name_ptr, t->name,
  2988								   len, codepage);
  2989					jfs_dirent->name_len += outlen;
  2990	
  2991					next = t->next;
  2992				}
  2993	
  2994				jfs_dirents++;
  2995				jfs_dirent = next_jfs_dirent(jfs_dirent);
  2996	skip_one:
  2997				if (!do_index)
  2998					dtoffset->index++;
  2999			}
  3000	
  3001			if (!overflow) {
  3002				/* Point to next leaf page */
  3003				if (p->header.flag & BT_ROOT)
  3004					bn = 0;
  3005				else {
  3006					bn = le64_to_cpu(p->header.next);
  3007					index = 0;
  3008					/* update offset (pn:index) for new page */
  3009					if (!do_index) {
  3010						dtoffset->pn++;
  3011						dtoffset->index = 0;
  3012					}
  3013				}
  3014				page_fixed = 0;
  3015			}
  3016	
  3017			/* unpin previous leaf page */
  3018			DT_PUTPAGE(mp);
  3019	
  3020			jfs_dirent = (struct jfs_dirent *) dirent_buf;
  3021			while (jfs_dirents--) {
  3022				ctx->pos = jfs_dirent->position;
  3023				if (!dir_emit(ctx, jfs_dirent->name,
  3024					    jfs_dirent->name_len,
  3025					    jfs_dirent->ino, DT_UNKNOWN))
  3026					goto out;
  3027				jfs_dirent = next_jfs_dirent(jfs_dirent);
  3028			}
  3029	
  3030			if (fix_page) {
  3031				if ((rc = add_missing_indices(ip, bn)))
  3032					goto out;
  3033				page_fixed = 1;
  3034			}
  3035	
  3036			if (!overflow && (bn == 0)) {
  3037				ctx->pos = DIREND;
  3038				break;
  3039			}
  3040	
  3041			DT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
  3042			if (rc) {
  3043				free_page(dirent_buf);
  3044				return rc;
  3045			}
  3046		}
  3047	
  3048	      out:
  3049		free_page(dirent_buf);
  3050	
  3051		return rc;
  3052	}
  3053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
