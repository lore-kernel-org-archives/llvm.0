Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D54B16EB42;
	Thu, 20 Nov 2025 01:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763603349; cv=none; b=Uz0NPRRRAFT1V8Eeba+zaEgp0eAqZaGDENgFEmZGhcjKAYyC1eWWwoNOoaAkSUVZW79NXpaCb6lA9jwmWV9KrvX+rXZS+knhp8qzpsVSmrvImYN2YdYZw5H8qoGTkc28bhf6FQpPgDjsnOQ3OI303FE6ky6MU2vUpp0cGWsFIKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763603349; c=relaxed/simple;
	bh=Df5Ba6iL1m2seu6kXW1KSKoo/Yfi0YIHT/eYCLvGzVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LfCmYc+YnbAXmMybI7qX14nfALjWIEpzifhy6XS9Q/Xt0S6fcvE8arx+NNo/ZuFmSvM9umjW96ahX7jG9jCOKZiiVUwCq47Exhf0yaGQQyDfNDfEVGX7cP/TrKFWvUWNyJY23q9htKQvm2r10A1mXpI3ZzuZAI1ylCfU4vcA8f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApFcqVi5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApFcqVi5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763603347; x=1795139347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Df5Ba6iL1m2seu6kXW1KSKoo/Yfi0YIHT/eYCLvGzVc=;
  b=ApFcqVi58VSdZ+rVn16dxX7ksRev4qWRphbHgTewe5RiomR2Xq/7cS1S
   vRUerrR+v05V8aMM1j4gqGRDStbCRjgK+QOpS5yx6pZlxw5IBFFn7YayE
   frVYNy/KAco0MvBqgxjJV29/Uhz9oae59oNcO7TEPJdUDRpnqa06KN7ym
   IVCUUq/Dsap7hGNiDLpRDdyS52YkDtZ9928l91Mo4oB6hSfI37ecOdQ4s
   /57I1IUEJgmvxnh6QXRUIZJzUuabYfAV7e4YqaeZNM/wJHRBsM/iAy+Rr
   mZun7WGmrwTyHoXnKuufQ67XNu6F+tDxH7yEmqTHC5S+C6eqom0K8xwyG
   g==;
X-CSE-ConnectionGUID: QWesQ/YFQniLJkRiH/UbTQ==
X-CSE-MsgGUID: icD36+XMR+eeoptAhxLjJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="91137527"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="91137527"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 17:49:06 -0800
X-CSE-ConnectionGUID: /pus76OKRay6g/ApwK6UnA==
X-CSE-MsgGUID: YfQvxrBFQTGYSfoAgkl0tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="190471171"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Nov 2025 17:49:05 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLtnC-0003VP-08;
	Thu, 20 Nov 2025 01:49:02 +0000
Date: Thu, 20 Nov 2025 09:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v3_20251106_ckeepax_add_sdca_class_driver 321/322]
 sound/soc/sdca/sdca_functions.c:94:28: error: incomplete definition of type
 'struct acpi_device'
Message-ID: <202511200901.4EA2s6vD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Charles,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20251106_ckeepax_add_sdca_class_driver
head:   782a3359140a882c5593256c7a8b1496ef50ec56
commit: a9afd4638fa2ae315e93079521388fb7421a5781 [321/322] ASoC: SDCA: Add basic SDCA class driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251120/202511200901.4EA2s6vD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200901.4EA2s6vD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200901.4EA2s6vD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sdca/sdca_functions.c:94:28: error: incomplete definition of type 'struct acpi_device'
      94 |         struct device *dev = &adev->dev;
         |                               ~~~~^
   include/linux/acpi.h:807:8: note: forward declaration of 'struct acpi_device'
     807 | struct acpi_device;
         |        ^
>> sound/soc/sdca/sdca_functions.c:107:8: error: call to undeclared function 'acpi_get_local_u64_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     107 |         ret = acpi_get_local_u64_address(adev->handle, &addr);
         |               ^
   sound/soc/sdca/sdca_functions.c:107:8: note: did you mean 'acpi_get_local_address'?
   include/linux/acpi.h:1062:19: note: 'acpi_get_local_address' declared here
    1062 | static inline int acpi_get_local_address(acpi_handle handle, u32 *addr)
         |                   ^
   sound/soc/sdca/sdca_functions.c:107:39: error: incomplete definition of type 'struct acpi_device'
     107 |         ret = acpi_get_local_u64_address(adev->handle, &addr);
         |                                          ~~~~^
   include/linux/acpi.h:807:8: note: forward declaration of 'struct acpi_device'
     807 | struct acpi_device;
         |        ^
   sound/soc/sdca/sdca_functions.c:180:6: error: redefinition of 'sdca_lookup_functions'
     180 | void sdca_lookup_functions(struct sdw_slave *slave)
         |      ^
   include/sound/sdca.h:70:20: note: previous definition is here
      70 | static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
         |                    ^
>> sound/soc/sdca/sdca_functions.c:190:2: error: call to undeclared function 'acpi_dev_for_each_child'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     190 |         acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
         |         ^
   sound/soc/sdca/sdca_functions.c:190:2: note: did you mean 'device_for_each_child'?
   include/linux/device.h:989:5: note: 'device_for_each_child' declared here
     989 | int device_for_each_child(struct device *parent, void *data,
         |     ^
   5 errors generated.
--
>> sound/soc/sdca/sdca_fdl.c:413:3: error: cannot jump from this goto statement to its label
     413 |                 goto reset_function;
         |                 ^
   sound/soc/sdca/sdca_fdl.c:417:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     417 |         guard(mutex)(&fdl_state->lock);
         |         ^
   include/linux/cleanup.h:401:15: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:177:1: note: expanded from here
     177 | __UNIQUE_ID_guard452
         | ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_SDCA
   Depends on [n]: SOUND [=m] && SND [=m] && SND_SOC [=m] && ACPI
   Selected by [m]:
   - SND_SOC_SDCA_CLASS [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m]


vim +94 sound/soc/sdca/sdca_functions.c

3a513da1ae3397 Pierre-Louis Bossart 2024-10-16   88  
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16   89  static int find_sdca_function(struct acpi_device *adev, void *data)
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16   90  {
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16   91  	struct fwnode_handle *function_node = acpi_fwnode_handle(adev);
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16   92  	struct sdca_device_data *sdca_data = data;
28edfaa10ca1b3 Maciej Strozek       2025-09-01   93  	struct sdw_slave *slave = container_of(sdca_data, struct sdw_slave, sdca_data);
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  @94  	struct device *dev = &adev->dev;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16   95  	struct fwnode_handle *control5; /* used to identify function type */
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16   96  	const char *function_name;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16   97  	u32 function_type;
629dd55cf77bd3 Charles Keepax       2025-02-05   98  	int function_index;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16   99  	u64 addr;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  100  	int ret;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  101  
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  102  	if (sdca_data->num_functions >= SDCA_MAX_FUNCTION_COUNT) {
935cd06bfad4b7 Charles Keepax       2024-12-20  103  		dev_err(dev, "maximum number of functions exceeded\n");
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  104  		return -EINVAL;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  105  	}
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  106  
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16 @107  	ret = acpi_get_local_u64_address(adev->handle, &addr);
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  108  	if (ret < 0)
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  109  		return ret;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  110  
c36297b1bd6e52 Charles Keepax       2024-12-20  111  	if (!addr || addr > 0x7) {
c36297b1bd6e52 Charles Keepax       2024-12-20  112  		dev_err(dev, "invalid addr: 0x%llx\n", addr);
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  113  		return -ENODEV;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  114  	}
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  115  
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  116  	/*
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  117  	 * Extracting the topology type for an SDCA function is a
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  118  	 * convoluted process.
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  119  	 * The Function type is only visible as a result of a read
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  120  	 * from a control. In theory this would mean reading from the hardware,
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  121  	 * but the SDCA/DisCo specs defined the notion of "DC value" - a constant
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  122  	 * represented with a DSD subproperty.
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  123  	 * Drivers have to query the properties for the control
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  124  	 * SDCA_CONTROL_ENTITY_0_FUNCTION_TOPOLOGY (0x05)
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  125  	 */
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  126  	control5 = fwnode_get_named_child_node(function_node,
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  127  					       "mipi-sdca-control-0x5-subproperties");
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  128  	if (!control5)
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  129  		return -ENODEV;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  130  
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  131  	ret = fwnode_property_read_u32(control5, "mipi-sdca-control-dc-value",
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  132  				       &function_type);
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  133  
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  134  	fwnode_handle_put(control5);
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  135  
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  136  	if (ret < 0) {
935cd06bfad4b7 Charles Keepax       2024-12-20  137  		dev_err(dev, "function type only supported as DisCo constant\n");
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  138  		return ret;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  139  	}
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  140  
28edfaa10ca1b3 Maciej Strozek       2025-09-01  141  	if (!sdca_device_quirk_match(slave, SDCA_QUIRKS_SKIP_FUNC_TYPE_PATCHING)) {
69dcf023f1f13c Charles Keepax       2024-12-20  142  		ret = patch_sdca_function_type(sdca_data->interface_revision, &function_type);
69dcf023f1f13c Charles Keepax       2024-12-20  143  		if (ret < 0) {
69dcf023f1f13c Charles Keepax       2024-12-20  144  			dev_err(dev, "SDCA version %#x invalid function type %d\n",
69dcf023f1f13c Charles Keepax       2024-12-20  145  				sdca_data->interface_revision, function_type);
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  146  			return ret;
69dcf023f1f13c Charles Keepax       2024-12-20  147  		}
28edfaa10ca1b3 Maciej Strozek       2025-09-01  148  	}
69dcf023f1f13c Charles Keepax       2024-12-20  149  
69dcf023f1f13c Charles Keepax       2024-12-20  150  	function_name = get_sdca_function_name(function_type);
69dcf023f1f13c Charles Keepax       2024-12-20  151  	if (!function_name) {
69dcf023f1f13c Charles Keepax       2024-12-20  152  		dev_err(dev, "invalid SDCA function type %d\n", function_type);
69dcf023f1f13c Charles Keepax       2024-12-20  153  		return -EINVAL;
69dcf023f1f13c Charles Keepax       2024-12-20  154  	}
69dcf023f1f13c Charles Keepax       2024-12-20  155  
69dcf023f1f13c Charles Keepax       2024-12-20  156  	dev_info(dev, "SDCA function %s (type %d) at 0x%llx\n",
69dcf023f1f13c Charles Keepax       2024-12-20  157  		 function_name, function_type, addr);
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  158  
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  159  	/* store results */
629dd55cf77bd3 Charles Keepax       2025-02-05  160  	function_index = sdca_data->num_functions;
629dd55cf77bd3 Charles Keepax       2025-02-05  161  	sdca_data->function[function_index].adr = addr;
629dd55cf77bd3 Charles Keepax       2025-02-05  162  	sdca_data->function[function_index].type = function_type;
629dd55cf77bd3 Charles Keepax       2025-02-05  163  	sdca_data->function[function_index].name = function_name;
996bf834d0b61c Pierre-Louis Bossart 2025-02-05  164  	sdca_data->function[function_index].node = function_node;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  165  	sdca_data->num_functions++;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  166  
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  167  	return 0;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  168  }
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  169  
629dd55cf77bd3 Charles Keepax       2025-02-05  170  /**
629dd55cf77bd3 Charles Keepax       2025-02-05  171   * sdca_lookup_functions - Parse sdca_device_desc for each Function
629dd55cf77bd3 Charles Keepax       2025-02-05  172   * @slave: SoundWire slave device to be processed.
629dd55cf77bd3 Charles Keepax       2025-02-05  173   *
629dd55cf77bd3 Charles Keepax       2025-02-05  174   * Iterate through the available SDCA Functions and fill in a short
629dd55cf77bd3 Charles Keepax       2025-02-05  175   * descriptor (struct sdca_function_desc) for each function, this
629dd55cf77bd3 Charles Keepax       2025-02-05  176   * information is stored along with the SoundWire slave device and
629dd55cf77bd3 Charles Keepax       2025-02-05  177   * used for adding drivers and quirks before the devices have fully
629dd55cf77bd3 Charles Keepax       2025-02-05  178   * probed.
629dd55cf77bd3 Charles Keepax       2025-02-05  179   */
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  180  void sdca_lookup_functions(struct sdw_slave *slave)
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  181  {
715159314dfafe Charles Keepax       2025-10-20  182  	struct device *sdev = &slave->dev;
715159314dfafe Charles Keepax       2025-10-20  183  	struct acpi_device *adev = to_acpi_device_node(sdev->fwnode);
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  184  
de35b06bf15cb5 Bard Liao            2024-11-13  185  	if (!adev) {
715159314dfafe Charles Keepax       2025-10-20  186  		dev_info(sdev, "no matching ACPI device found, ignoring peripheral\n");
de35b06bf15cb5 Bard Liao            2024-11-13  187  		return;
de35b06bf15cb5 Bard Liao            2024-11-13  188  	}
629dd55cf77bd3 Charles Keepax       2025-02-05  189  
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16 @190  	acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  191  }
cdd30ebb1b9f36 Peter Zijlstra       2024-12-02  192  EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  193  

:::::: The code at line 94 was first introduced by commit
:::::: 3a513da1ae33972e59efeef7908061f1f24af480 ASoC: SDCA: add initial module

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
