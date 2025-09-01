Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA9D267729;
	Mon,  1 Sep 2025 23:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756770784; cv=none; b=bHuNke9EdkcRmNCIdbevwKdSTYggMTIyu+NjMNTeITkGvOdoEg1s8x8m7lebb0YVpn5fnAqafic5wJ1Len8khMbt21dRxQvT4pzKxQIJSgwj1GLbA1ml/HDzBlp7lNzMhIAqK8o6Kl6NGbpYkxXC8e5Kd3Cj8BkQlhVb2kdDqIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756770784; c=relaxed/simple;
	bh=AKaz2gXLFBcGppZPdkDcXxHQrB0YeI3uov69H4gLVQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jt1bH0Zrtnrg6w0BSyOgY4xbx4MG5SsJDHSczUq9G0vAPbD6KCtJnMb4HX9ovw8yUG+IW//N4VEO6n7Ej2qslNrq0NBXkYflSkCL//OZnGkUfJDSZmvgzRgq4hHmADElkfvghadmgAm+IJpzmTp+oR649hOY/14yrAtCw7+V+jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWCEC75C; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWCEC75C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756770782; x=1788306782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AKaz2gXLFBcGppZPdkDcXxHQrB0YeI3uov69H4gLVQc=;
  b=kWCEC75CWBuJC039L9KIEU6T9rGbwTPvKgugJ4fkkLfftTgpkef2EwUI
   4DZ1Kr++egShdzbiZY26qSQKzrcjMp0C7yp9zsLOSSluQDVhDY81IkvyV
   lJgnriG0i+JgeWKLOVpXgsS4YZlJiDIMZGSyXEjZrwE+56+8GbLdAcsTF
   eET5o6N5yAO5zb4++dQ39bytLjMoukqEqxjVp1N36/23aeiFLdZ/MUpC5
   Nxc7eP5eRfLGo1REdMaUYwZl4IPXcuqbHT7NS6peaiDoMCRInzKqQkc47
   sCfomeg30IAiIjFjpKyLND4u2rKbHgUwpgtGHJwWX/YBpzd8CSVIBA/w8
   A==;
X-CSE-ConnectionGUID: O3iQGuOoRS+IT0DJPaxMBw==
X-CSE-MsgGUID: 2JGBgBPUTbmwZtFKauE42A==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="69732728"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="69732728"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 16:53:02 -0700
X-CSE-ConnectionGUID: KAwL+83pSZywVdleGqDz4Q==
X-CSE-MsgGUID: 6Lzorvm5S2KPXqUtZBwAUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171566478"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Sep 2025 16:53:00 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utEKY-0001Df-1t;
	Mon, 01 Sep 2025 23:52:58 +0000
Date: Tue, 2 Sep 2025 07:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfs-testing 9/9] fs/nfsd/nfs4xdr.c:2646:2: error: called
 object type 'int' is not a function or function pointer
Message-ID: <202509020747.cpYtM7wb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfs-testing
head:   4e87a4abdfe1b489fbcbd282c2f0dea2fbfd227d
commit: 4e87a4abdfe1b489fbcbd282c2f0dea2fbfd227d [9/9] sunrpc: add a Kconfig option to redirect dfprintk() output to trace buffer
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250902/202509020747.cpYtM7wb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020747.cpYtM7wb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020747.cpYtM7wb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/nfs4xdr.c:2646:2: error: called object type 'int' is not a function or function pointer
    2646 |         dprintk("nfsd4_encode_components(%s)\n", components);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sunrpc/debug.h:25:2: note: expanded from macro 'dprintk'
      25 |         dfprintk(FACILITY, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sunrpc/debug.h:42:3: note: expanded from macro 'dfprintk'
      42 |                 __sunrpc_printk(fmt, ##__VA_ARGS__);                    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sunrpc/debug.h:34:37: note: expanded from macro '__sunrpc_printk'
      34 | #  define __sunrpc_printk(fmt, ...)     trace_printk(fmt, ##__VA_ARGS__)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:265:3: note: expanded from macro 'trace_printk'
     265 |                 trace_puts(fmt);                        \
         |                 ^~~~~~~~~~~~~~~
   include/linux/kernel.h:321:38: note: expanded from macro 'trace_puts'
     321 |                 __trace_puts(_THIS_IP_, str, strlen(str));              \
         |                                              ~~~~~~^
   1 error generated.


vim +/int +2646 fs/nfsd/nfs4xdr.c

21d316a767ac2e Chuck Lever           2023-10-09  2632  
81c3f4130202a1 J.Bruce Fields        2006-10-04  2633  /* Encode as an array of strings the string given with components
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2634   * separated @sep, escaped with esc_enter and esc_exit.
81c3f4130202a1 J.Bruce Fields        2006-10-04  2635   */
ddd1ea56367202 J. Bruce Fields       2013-08-27  2636  static __be32 nfsd4_encode_components_esc(struct xdr_stream *xdr, char sep,
ddd1ea56367202 J. Bruce Fields       2013-08-27  2637  					  char *components, char esc_enter,
ddd1ea56367202 J. Bruce Fields       2013-08-27  2638  					  char esc_exit)
81c3f4130202a1 J.Bruce Fields        2006-10-04  2639  {
ddd1ea56367202 J. Bruce Fields       2013-08-27  2640  	__be32 *p;
082d4bd72a4527 J. Bruce Fields       2013-08-29  2641  	__be32 pathlen;
082d4bd72a4527 J. Bruce Fields       2013-08-29  2642  	int pathlen_offset;
81c3f4130202a1 J.Bruce Fields        2006-10-04  2643  	int strlen, count=0;
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2644  	char *str, *end, *next;
81c3f4130202a1 J.Bruce Fields        2006-10-04  2645  
81c3f4130202a1 J.Bruce Fields        2006-10-04 @2646  	dprintk("nfsd4_encode_components(%s)\n", components);
082d4bd72a4527 J. Bruce Fields       2013-08-29  2647  
082d4bd72a4527 J. Bruce Fields       2013-08-29  2648  	pathlen_offset = xdr->buf->len;
ddd1ea56367202 J. Bruce Fields       2013-08-27  2649  	p = xdr_reserve_space(xdr, 4);
ddd1ea56367202 J. Bruce Fields       2013-08-27  2650  	if (!p)
81c3f4130202a1 J.Bruce Fields        2006-10-04  2651  		return nfserr_resource;
082d4bd72a4527 J. Bruce Fields       2013-08-29  2652  	p++; /* We will fill this in with @count later */
082d4bd72a4527 J. Bruce Fields       2013-08-29  2653  
81c3f4130202a1 J.Bruce Fields        2006-10-04  2654  	end = str = components;
81c3f4130202a1 J.Bruce Fields        2006-10-04  2655  	while (*end) {
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2656  		bool found_esc = false;
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2657  
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2658  		/* try to parse as esc_start, ..., esc_end, sep */
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2659  		if (*str == esc_enter) {
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2660  			for (; *end && (*end != esc_exit); end++)
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2661  				/* find esc_exit or end of string */;
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2662  			next = end + 1;
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2663  			if (*end && (!*next || *next == sep)) {
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2664  				str++;
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2665  				found_esc = true;
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2666  			}
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2667  		}
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2668  
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2669  		if (!found_esc)
81c3f4130202a1 J.Bruce Fields        2006-10-04  2670  			for (; *end && (*end != sep); end++)
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2671  				/* find sep or end of string */;
e7a0444aef4a16 Weston Andros Adamson 2012-04-24  2672  
81c3f4130202a1 J.Bruce Fields        2006-10-04  2673  		strlen = end - str;
81c3f4130202a1 J.Bruce Fields        2006-10-04  2674  		if (strlen) {
30c1d2411acd6d Chuck Lever           2024-10-17  2675  			if (xdr_stream_encode_opaque(xdr, str, strlen) < 0)
81c3f4130202a1 J.Bruce Fields        2006-10-04  2676  				return nfserr_resource;
81c3f4130202a1 J.Bruce Fields        2006-10-04  2677  			count++;
30c1d2411acd6d Chuck Lever           2024-10-17  2678  		} else
81c3f4130202a1 J.Bruce Fields        2006-10-04  2679  			end++;
5a64e56976f1ba Benjamin Coddington   2014-12-07  2680  		if (found_esc)
5a64e56976f1ba Benjamin Coddington   2014-12-07  2681  			end = next;
5a64e56976f1ba Benjamin Coddington   2014-12-07  2682  
81c3f4130202a1 J.Bruce Fields        2006-10-04  2683  		str = end;
81c3f4130202a1 J.Bruce Fields        2006-10-04  2684  	}
bf7491f1be5e12 Benjamin Coddington   2014-12-07  2685  	pathlen = htonl(count);
082d4bd72a4527 J. Bruce Fields       2013-08-29  2686  	write_bytes_to_xdr_buf(xdr->buf, pathlen_offset, &pathlen, 4);
81c3f4130202a1 J.Bruce Fields        2006-10-04  2687  	return 0;
81c3f4130202a1 J.Bruce Fields        2006-10-04  2688  }
81c3f4130202a1 J.Bruce Fields        2006-10-04  2689  

:::::: The code at line 2646 was first introduced by commit
:::::: 81c3f4130202a1dcb2b28ab56684eb5e9d43d8c1 [PATCH] knfsd: nfsd4: xdr encoding for fs_locations

:::::: TO: J.Bruce Fields <bfields@fieldses.org>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
