Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B77161FF2;
	Tue, 17 Dec 2024 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734450583; cv=none; b=RqRkVEJ6uEU3T6PkgZmeLoGTboPKETNYHsmJjhNf3as1yTXlQT5i7BaCFLSwA2gmxzge+xODL6xxGcG3CYmeet6R0tTm9UkzNPVjUq3xRLh79HZrXtm08pCSD5BGhnA0Sf2tYOMaZbni20OIm/r3i+4l/Q/wPPjgreoBTDjHXgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734450583; c=relaxed/simple;
	bh=QkKB8/0Hksyr3Ur7YF+1udEcwQOMjSVbrOU8cUPns5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r3FaG6inE5FqlaJxs7DYyJr1bP1AVgw+qKKIDg6i+gSX99ehUIhtX7YjYFvp5dQqxp1VxAEviFv+CwYsStL1IYrpR++MEfnDB61Y8blezvYuSXtr46G9a00CBqKZB7rNGONVDcZd93D1lsyhClPhC4dG4zhc4u1w3kgg/9nTZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iabd6okG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iabd6okG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734450581; x=1765986581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QkKB8/0Hksyr3Ur7YF+1udEcwQOMjSVbrOU8cUPns5Q=;
  b=iabd6okGf+cFZlXlo3Ye+0zXvQ+7LvjIBWb+C2mu8lxFqVIUf7q55/3j
   jDPg9UcplhL8x7yBw2J0cX8ydxcPUEItkFrReQqAHbS8j7nz/aieveZ1w
   Qlj7aAk37hQAQJoZJZRJVKbx/Ey3lvP6PkDlslaNfKUyO4axRtw85hu6u
   iiSuX8KdTvr9BhZur2lZ3pigfOqOXp+IwIONOW3Q3TbdogyIMVYIwkBUn
   FbvhLpq/iATk5ZShYBuPiWrKfaaT2z72xf/Sdg+FxXFhRyic5J0ATINdg
   pepLHBt9s8WhfJUYwBvkwjlsgAIaf5lz1pSxdUvCeqkyrsoK0SKYfLe+G
   w==;
X-CSE-ConnectionGUID: 6120uPV8QMq830wj9SXKDA==
X-CSE-MsgGUID: WiRL+q6wTvC/AtAmzZT3JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34774634"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34774634"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 07:49:40 -0800
X-CSE-ConnectionGUID: 2nGF2eN4SxaBL9b07RIaTA==
X-CSE-MsgGUID: yyZJI99+Rrqg9Q2l/IRanQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="98147156"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2024 07:49:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNZpJ-000F6i-0C;
	Tue, 17 Dec 2024 15:49:37 +0000
Date: Tue, 17 Dec 2024 23:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/printf-modalias 1/1] lib/vsprintf.c:2230:4: warning: label
 followed by a declaration is a C23 extension
Message-ID: <202412172352.WPdTcXgW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/printf-modalias
head:   57a93c86e542d479453f704d4911118c678bf31a
commit: 57a93c86e542d479453f704d4911118c678bf31a [1/1] of: Add printf '%pOFm' for generating modalias
config: arm64-randconfig-001-20241217 (https://download.01.org/0day-ci/archive/20241217/202412172352.WPdTcXgW-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412172352.WPdTcXgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412172352.WPdTcXgW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/vsprintf.c:30:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from lib/vsprintf.c:50:
   In file included from lib/../mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> lib/vsprintf.c:2230:4: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    2230 |                         ssize_t len = of_modalias(dn, buf, end - buf);
         |                         ^
   4 warnings generated.


vim +2230 lib/vsprintf.c

  2146	
  2147	static noinline_for_stack
  2148	char *device_node_string(char *buf, char *end, struct device_node *dn,
  2149				 struct printf_spec spec, const char *fmt)
  2150	{
  2151		char tbuf[sizeof("xxxx") + 1];
  2152		const char *p;
  2153		int ret;
  2154		char *buf_start = buf;
  2155		struct property *prop;
  2156		bool has_mult, pass;
  2157	
  2158		struct printf_spec str_spec = spec;
  2159		str_spec.field_width = -1;
  2160	
  2161		if (fmt[0] != 'F')
  2162			return error_string(buf, end, "(%pO?)", spec);
  2163	
  2164		if (!IS_ENABLED(CONFIG_OF))
  2165			return error_string(buf, end, "(%pOF?)", spec);
  2166	
  2167		if (check_pointer(&buf, end, dn, spec))
  2168			return buf;
  2169	
  2170		/* simple case without anything any more format specifiers */
  2171		fmt++;
  2172		if (fmt[0] == '\0' || strcspn(fmt,"fnpPFcCm") > 0)
  2173			fmt = "f";
  2174	
  2175		for (pass = false; strspn(fmt,"fnpPFcCm"); fmt++, pass = true) {
  2176			int precision;
  2177			if (pass) {
  2178				if (buf < end)
  2179					*buf = ':';
  2180				buf++;
  2181			}
  2182	
  2183			switch (*fmt) {
  2184			case 'f':	/* full_name */
  2185				buf = fwnode_full_name_string(of_fwnode_handle(dn), buf,
  2186							      end);
  2187				break;
  2188			case 'n':	/* name */
  2189				p = fwnode_get_name(of_fwnode_handle(dn));
  2190				precision = str_spec.precision;
  2191				str_spec.precision = strchrnul(p, '@') - p;
  2192				buf = string(buf, end, p, str_spec);
  2193				str_spec.precision = precision;
  2194				break;
  2195			case 'p':	/* phandle */
  2196				buf = number(buf, end, (unsigned int)dn->phandle, default_dec_spec);
  2197				break;
  2198			case 'P':	/* path-spec */
  2199				p = fwnode_get_name(of_fwnode_handle(dn));
  2200				if (!p[1])
  2201					p = "/";
  2202				buf = string(buf, end, p, str_spec);
  2203				break;
  2204			case 'F':	/* flags */
  2205				tbuf[0] = of_node_check_flag(dn, OF_DYNAMIC) ? 'D' : '-';
  2206				tbuf[1] = of_node_check_flag(dn, OF_DETACHED) ? 'd' : '-';
  2207				tbuf[2] = of_node_check_flag(dn, OF_POPULATED) ? 'P' : '-';
  2208				tbuf[3] = of_node_check_flag(dn, OF_POPULATED_BUS) ? 'B' : '-';
  2209				tbuf[4] = 0;
  2210				buf = string_nocheck(buf, end, tbuf, str_spec);
  2211				break;
  2212			case 'c':	/* major compatible string */
  2213				ret = of_property_read_string(dn, "compatible", &p);
  2214				if (!ret)
  2215					buf = string(buf, end, p, str_spec);
  2216				break;
  2217			case 'C':	/* full compatible string */
  2218				has_mult = false;
  2219				of_property_for_each_string(dn, "compatible", prop, p) {
  2220					if (has_mult)
  2221						buf = string_nocheck(buf, end, ",", str_spec);
  2222					buf = string_nocheck(buf, end, "\"", str_spec);
  2223					buf = string(buf, end, p, str_spec);
  2224					buf = string_nocheck(buf, end, "\"", str_spec);
  2225	
  2226					has_mult = true;
  2227				}
  2228				break;
  2229			case 'm':
> 2230				ssize_t len = of_modalias(dn, buf, end - buf);
  2231				if (len > 0)
  2232					buf += len;
  2233				break;
  2234			default:
  2235				break;
  2236			}
  2237		}
  2238	
  2239		return widen_string(buf, buf - buf_start, end, spec);
  2240	}
  2241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
