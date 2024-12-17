Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4571F63CB;
	Tue, 17 Dec 2024 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448080; cv=none; b=FyC489/ndkdb7Tz0Kqq5k7phqbz9KCK4TLLIvjEwivjd+tXND5KCCRElnYXUkCvUg4bhwVPhHFRRUY+w0F2/lBC9pCR5Be0RZ9M04vCNpjin/bLtSgC1besa7kXJVzD/a32RhBj1vlk7wYuBFa3wIIdx0N1WV8fBRBky/C3YfJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448080; c=relaxed/simple;
	bh=6eu60HxVjursrd590qttcgm8QLP91ovuo/9YZIq0Qv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CFbT83qD9KcQ0JAoYR6UZiBbz12rBwjn95o5sDxO8w6rat4BlIoP1SLA38ji1usbVkOmjaf2afpT2OSkjT/2nrbq9Lq8iFKhv20e7eDcxHMq6lloJMD7uswyK+8tsmMhsWm6i9VWt59v6p0C9P6kcN+gU5AKU6cBAaeTZr11CYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y45j/5BN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y45j/5BN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734448079; x=1765984079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6eu60HxVjursrd590qttcgm8QLP91ovuo/9YZIq0Qv8=;
  b=Y45j/5BNadnxd2Zc+ger3RsCT1f1xri+GG9XQsGEu4vFnv3QPyWqPJVF
   jphbjXmbqt7jKUodydp9f/eqfljdhZO7wPD9OBlEknVdp+RHtlHlSWdmq
   LsuQ/vZDHf6iOz/DTSE31poKotArAtQNV5AX0/bYLkuMmlnZRg3tYdEbq
   kbUWkqoNTTDE3YISgg8adom/lGAV0Woca5k1OEMoB4sI83D2rNaiFiu8T
   mH5I+Uebil7aJg5FMc1T9l9RgsqqJ8vWg8dr4/oxT3q0xF+KpZ16OYy27
   ZYJUxBttCC6imlo7FxOvvMq40XUcwqKojapE8sPFkylGaYFPzzsKgJAiU
   w==;
X-CSE-ConnectionGUID: V1quakOlR1OArkeI4tTxzQ==
X-CSE-MsgGUID: YrCDhG5sRWikNG/a3UY+pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45884170"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45884170"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 07:07:37 -0800
X-CSE-ConnectionGUID: keUFE/4dRaKl25uvnm+z4g==
X-CSE-MsgGUID: QMpzPoltS7m7sPLiax3sow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134901881"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Dec 2024 07:07:36 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNZAc-000F5V-0T;
	Tue, 17 Dec 2024 15:07:34 +0000
Date: Tue, 17 Dec 2024 23:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/printf-modalias 1/1] lib/vsprintf.c:2230:4: error: expected
 expression
Message-ID: <202412172335.n8VuKIwK-lkp@intel.com>
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
config: arm-randconfig-001-20241217 (https://download.01.org/0day-ci/archive/20241217/202412172335.n8VuKIwK-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412172335.n8VuKIwK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412172335.n8VuKIwK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/vsprintf.c:2230:4: error: expected expression
                           ssize_t len = of_modalias(dn, buf, end - buf);
                           ^
>> lib/vsprintf.c:2231:8: error: use of undeclared identifier 'len'
                           if (len > 0)
                               ^
   lib/vsprintf.c:2232:12: error: use of undeclared identifier 'len'
                                   buf += len;
                                          ^
   3 errors generated.


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
> 2231				if (len > 0)
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
