Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37AC31D370;
	Mon, 15 Dec 2025 05:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765775236; cv=none; b=ITSF6FrWigjJ7Jh82+gIo+CXydPIFxx0slTgdJ6yYeo2gSBX7lWF3FAUqt0NNRhG3rpQFNtqwWkgJIKjRz9qiAOb8TGlDldgQcxQICh4IESyFe9bHKlX98rkiQPeYOBwLfJlVfZl/Y/RjaTkXnOec1sSKu0pgKij6KYkpbTHz5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765775236; c=relaxed/simple;
	bh=H7oz5aPPuw46ky4xfoA1YOY0HQhrEuby/Z7KEKmP8kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTJh5eTOAm1PwKiJHNSG0PxgDr/k5+m7R5HKvVdHnrm1h8vbCu9N6tqvLrpItmv35Dh2NKPiiD09gDSruqB5M7RzPObVHrrKqs3F57BH/Q+H9CRWZBAPAs+Z25rXtQhPN3jclmZ4cD5SKqgjtae8FuY2ot5fQuolfaX0YwQqQ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oeg2sXvZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oeg2sXvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765775235; x=1797311235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H7oz5aPPuw46ky4xfoA1YOY0HQhrEuby/Z7KEKmP8kU=;
  b=Oeg2sXvZ789YBD9dVvZpySZ1LU/ltfb3sdPrL8HM9lFlv0jJ1xs+Glyg
   9yd+QCv2MuSzd8O6lE1zf11SP4qt60e49ff3iZt/YW2hQnawGdThKmAjd
   HBY/ODlKbdrRJybuN5SPCY2u2OLILOdy9b5rvRM8O0/248HBOVbfGVu66
   T3RoD9oSTa2/fkLru/anTe82+SeHebIe3vhIjlKFBypUOWXevnaddI2EC
   KpAkZaeUsAgkRWHcbLKW3bKqB0j8OUqmRhGkM9IE3Wc63goNd/IL+hyty
   u9m9Hg0d/gb6iEfsfXpj4r5dt3IfIYzGZvxvg2XqXQzW4YWT3pVhPlOI8
   A==;
X-CSE-ConnectionGUID: EIYqR8NRTNepz7mNoQIqfQ==
X-CSE-MsgGUID: jw39Qlw/QmGv+hfQ55eZnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="77984188"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="77984188"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 21:07:14 -0800
X-CSE-ConnectionGUID: M3VoG9VdTfOXFJlbi5UnjA==
X-CSE-MsgGUID: oUKs0TtCRQCFyyn8ZB27+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197248609"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Dec 2025 21:07:11 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV0nd-000000009oT-15ID;
	Mon, 15 Dec 2025 05:07:09 +0000
Date: Mon, 15 Dec 2025 13:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"(maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))" <x86@kernel.org>,
	Jean Delvare <jdelvare@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: Re: [PATCH 3/5] firmware: dmi: Read additional information when
 decoding DMI table
Message-ID: <202512151555.bDb36bV2-lkp@intel.com>
References: <20251214185309.152614-4-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214185309.152614-4-superm1@kernel.org>

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on linus/master tip/auto-latest v6.19-rc1 next-20251215]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello-AMD/firmware-dmi-Correct-an-indexing-error-in-dmi-h/20251215-025606
base:   tip/master
patch link:    https://lore.kernel.org/r/20251214185309.152614-4-superm1%40kernel.org
patch subject: [PATCH 3/5] firmware: dmi: Read additional information when decoding DMI table
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251215/202512151555.bDb36bV2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151555.bDb36bV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151555.bDb36bV2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/dmi_scan.c:398:14: warning: variable 'strings' set but not used [-Wunused-but-set-variable]
     398 |         const char *strings;
         |                     ^
>> drivers/firmware/dmi_scan.c:400:6: warning: variable 'count' set but not used [-Wunused-but-set-variable]
     400 |         int count = 0;
         |             ^
   2 warnings generated.


vim +/count +400 drivers/firmware/dmi_scan.c

   395	
   396	static void __init dmi_save_additional(const struct dmi_additional_info *info)
   397	{
   398		const char *strings;
   399		const u8 *data;
 > 400		int count = 0;
   401		int i;
   402	
   403		if (!info || info->header.length < 5 + info->count * 5)
   404			return;
   405	
   406		data = info->entries;
   407		strings = (const char *)(data + info->count * 5);
   408	
   409		for (i = 0; i < info->count; i++) {
   410			u8 entry_length = data[i * 5];
   411			u8 string_num = data[i * 5 + 4];
   412			const char *string_ptr;
   413			char *value;
   414			int len;
   415	
   416			if (entry_length < 5 || string_num == 0)
   417				continue;
   418	
   419			string_ptr = dmi_string_nosave(&info->header, string_num);
   420			if (!string_ptr || !*string_ptr)
   421				continue;
   422	
   423			len = strlen(string_ptr);
   424			if (len == 0)
   425				continue;
   426	
   427			value = dmi_alloc(len + 1);
   428			if (!value)
   429				continue;
   430	
   431			strscpy(value, string_ptr, len + 1);
   432	
   433			dmi_save_one_device(DMI_DEV_TYPE_ADDITIONAL, value);
   434			count++;
   435		}
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
