Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9A116DEB3;
	Fri, 18 Jul 2025 19:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752867894; cv=none; b=E8lhMnaLX0L4kVKGFliOzsFTR9ZhfoAQkoXKj5i5GitLGI3Wf1VzUcsASGhMbsPFHt+Tcl2vm42ax+gs+IFmC1eUoLEjoj4p5FiNaVVti3HMZwkoZNv0shE0/HjESutTcHatrnykR0uGupigT8dnroPfjokoRDvJBxrFj9Ln/VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752867894; c=relaxed/simple;
	bh=y5r+/ExJI/M/+UHzf0hOc+6M7O+w/G7e1WfHp03IAsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOijNKvwgdPk36+zDae+RFSjwbubG6fLm1ShayA/0qlF3DRZKUwhU2Yn6jeQ5l9r8dYJ0xG0bXZq10ovtEE7i5geZN9+QqE+oqU0hXockoilomSK36esHTeJN5KLZJTLyJcQd0mwTh43AtvTsqHtG/na7sIeDckhbqpYmx8N/KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXms6k47; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXms6k47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752867892; x=1784403892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y5r+/ExJI/M/+UHzf0hOc+6M7O+w/G7e1WfHp03IAsc=;
  b=QXms6k47RinDschJ2lJvDG15uT7aVmp/59StUNIQxQyvS5QBFxZpKDgO
   hphRv7uV6Zo7tyE+hNsxyu8jtayThdVC/mAFWTJKa/yumin+7+ktyt+D+
   d+kGXkkoz060vA60ZmDpbV73ZPxZKtkCfDQQiGZfC5C+b7oNDnLof08CO
   znpEP+DIjpo86x7Iik8Xfip2pyPTZYjKYyipB4FyUOuMOA0H4gx8nC7AN
   M30ZT1e8HG5G4Tc1/gX++X3BP9FGENvMpyyBJ4Z/Mnz5cZ6jlGw4mkij6
   rKBcnHso8R336EtIQ4COX5nr7413wtqkOjC7uiITH74DfTM9kyt6GNP5o
   Q==;
X-CSE-ConnectionGUID: ksIdjqJoSFizcVDaVT6Z0g==
X-CSE-MsgGUID: Jf9J89/IQdmXcdQgpNWn0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55256178"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="55256178"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 12:44:51 -0700
X-CSE-ConnectionGUID: 7fmSRsjYRJmplAeBMwuu7w==
X-CSE-MsgGUID: J1fPHincSRKqLumeZCjllg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="157508409"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Jul 2025 12:44:49 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucr0g-000Eyx-0L;
	Fri, 18 Jul 2025 19:44:46 +0000
Date: Sat, 19 Jul 2025 03:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sung-Chi Li via B4 Relay <devnull+lschyi.chromium.org@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 1/2] hwmon: (cros_ec) add PWM control over fans
Message-ID: <202507190311.AMjh38Rm-lkp@intel.com>
References: <20250718-cros_ec_fan-v6-1-8df018396b56@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718-cros_ec_fan-v6-1-8df018396b56@chromium.org>

Hi Sung-Chi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb]

url:    https://github.com/intel-lab-lkp/linux/commits/Sung-Chi-Li-via-B4-Relay/hwmon-cros_ec-add-PWM-control-over-fans/20250718-151054
base:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
patch link:    https://lore.kernel.org/r/20250718-cros_ec_fan-v6-1-8df018396b56%40chromium.org
patch subject: [PATCH v6 1/2] hwmon: (cros_ec) add PWM control over fans
config: i386-buildonly-randconfig-006-20250719 (https://download.01.org/0day-ci/archive/20250719/202507190311.AMjh38Rm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190311.AMjh38Rm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190311.AMjh38Rm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/cros_ec_hwmon.c:49:36: error: variable has incomplete type 'struct ec_params_pwm_get_fan_duty'
      49 |         struct ec_params_pwm_get_fan_duty req = {
         |                                           ^
   drivers/hwmon/cros_ec_hwmon.c:49:9: note: forward declaration of 'struct ec_params_pwm_get_fan_duty'
      49 |         struct ec_params_pwm_get_fan_duty req = {
         |                ^
>> drivers/hwmon/cros_ec_hwmon.c:52:38: error: variable has incomplete type 'struct ec_response_pwm_get_fan_duty'
      52 |         struct ec_response_pwm_get_fan_duty resp;
         |                                             ^
   drivers/hwmon/cros_ec_hwmon.c:52:9: note: forward declaration of 'struct ec_response_pwm_get_fan_duty'
      52 |         struct ec_response_pwm_get_fan_duty resp;
         |                ^
>> drivers/hwmon/cros_ec_hwmon.c:56:6: error: use of undeclared identifier 'EC_CMD_PWM_GET_FAN_DUTY'
      56 |                           EC_CMD_PWM_GET_FAN_DUTY, &req, sizeof(req), &resp, sizeof(resp));
         |                           ^
>> drivers/hwmon/cros_ec_hwmon.c:68:10: error: use of undeclared identifier 'EC_AUTO_FAN_CONTROL_CMD_GET'; did you mean 'EC_CHARGE_CONTROL_CMD_GET'?
      68 |                 .cmd = EC_AUTO_FAN_CONTROL_CMD_GET,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        EC_CHARGE_CONTROL_CMD_GET
   include/linux/platform_data/cros_ec_commands.h:3919:2: note: 'EC_CHARGE_CONTROL_CMD_GET' declared here
    3919 |         EC_CHARGE_CONTROL_CMD_GET,
         |         ^
>> drivers/hwmon/cros_ec_hwmon.c:67:36: error: variable has incomplete type 'struct ec_params_auto_fan_ctrl_v2'
      67 |         struct ec_params_auto_fan_ctrl_v2 req = {
         |                                           ^
   drivers/hwmon/cros_ec_hwmon.c:67:9: note: forward declaration of 'struct ec_params_auto_fan_ctrl_v2'
      67 |         struct ec_params_auto_fan_ctrl_v2 req = {
         |                ^
>> drivers/hwmon/cros_ec_hwmon.c:71:38: error: variable has incomplete type 'struct ec_response_auto_fan_control'
      71 |         struct ec_response_auto_fan_control resp;
         |                                             ^
   drivers/hwmon/cros_ec_hwmon.c:71:9: note: forward declaration of 'struct ec_response_auto_fan_control'
      71 |         struct ec_response_auto_fan_control resp;
         |                ^
>> drivers/hwmon/cros_ec_hwmon.c:217:10: error: use of undeclared identifier 'EC_AUTO_FAN_CONTROL_CMD_SET'; did you mean 'EC_CHARGE_CONTROL_CMD_SET'?
     217 |                 .cmd = EC_AUTO_FAN_CONTROL_CMD_SET,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        EC_CHARGE_CONTROL_CMD_SET
   include/linux/platform_data/cros_ec_commands.h:3918:2: note: 'EC_CHARGE_CONTROL_CMD_SET' declared here
    3918 |         EC_CHARGE_CONTROL_CMD_SET = 0,
         |         ^
   drivers/hwmon/cros_ec_hwmon.c:215:36: error: variable has incomplete type 'struct ec_params_auto_fan_ctrl_v2'
     215 |         struct ec_params_auto_fan_ctrl_v2 req = {
         |                                           ^
   drivers/hwmon/cros_ec_hwmon.c:215:9: note: forward declaration of 'struct ec_params_auto_fan_ctrl_v2'
     215 |         struct ec_params_auto_fan_ctrl_v2 req = {
         |                ^
   drivers/hwmon/cros_ec_hwmon.c:381:43: error: use of undeclared identifier 'EC_CMD_PWM_GET_FAN_DUTY'
     381 |         return is_cros_ec_cmd_available(cros_ec, EC_CMD_PWM_GET_FAN_DUTY,
         |                                                  ^
   9 errors generated.


vim +49 drivers/hwmon/cros_ec_hwmon.c

    46	
    47	static int cros_ec_hwmon_read_pwm_value(struct cros_ec_device *cros_ec, u8 index, u8 *pwm_value)
    48	{
  > 49		struct ec_params_pwm_get_fan_duty req = {
    50			.fan_idx = index,
    51		};
  > 52		struct ec_response_pwm_get_fan_duty resp;
    53		int ret;
    54	
    55		ret = cros_ec_cmd(cros_ec, CROS_EC_HWMON_PWM_GET_FAN_DUTY_CMD_VERSION,
  > 56				  EC_CMD_PWM_GET_FAN_DUTY, &req, sizeof(req), &resp, sizeof(resp));
    57		if (ret < 0)
    58			return ret;
    59	
    60		*pwm_value = (u8)DIV_ROUND_CLOSEST(le32_to_cpu(resp.percent) * 255, 100);
    61		return 0;
    62	}
    63	
    64	static int cros_ec_hwmon_read_pwm_enable(struct cros_ec_device *cros_ec, u8 index,
    65						 u8 *control_method)
    66	{
  > 67		struct ec_params_auto_fan_ctrl_v2 req = {
  > 68			.cmd = EC_AUTO_FAN_CONTROL_CMD_GET,
    69			.fan_idx = index,
    70		};
  > 71		struct ec_response_auto_fan_control resp;
    72		int ret;
    73	
    74		ret = cros_ec_cmd(cros_ec, CROS_EC_HWMON_THERMAL_AUTO_FAN_CTRL_CMD_VERSION,
    75				  EC_CMD_THERMAL_AUTO_FAN_CTRL, &req, sizeof(req), &resp, sizeof(resp));
    76		if (ret < 0)
    77			return ret;
    78	
    79		*control_method = resp.is_auto ? 2 : 1;
    80		return 0;
    81	}
    82	
    83	static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
    84	{
    85		unsigned int offset;
    86		int ret;
    87	
    88		if (index < EC_TEMP_SENSOR_ENTRIES)
    89			offset = EC_MEMMAP_TEMP_SENSOR + index;
    90		else
    91			offset = EC_MEMMAP_TEMP_SENSOR_B + index - EC_TEMP_SENSOR_ENTRIES;
    92	
    93		ret = cros_ec_cmd_readmem(cros_ec, offset, 1, temp);
    94		if (ret < 0)
    95			return ret;
    96		return 0;
    97	}
    98	
    99	static bool cros_ec_hwmon_is_error_fan(u16 speed)
   100	{
   101		return speed == EC_FAN_SPEED_NOT_PRESENT || speed == EC_FAN_SPEED_STALLED;
   102	}
   103	
   104	static bool cros_ec_hwmon_is_error_temp(u8 temp)
   105	{
   106		return temp == EC_TEMP_SENSOR_NOT_PRESENT     ||
   107		       temp == EC_TEMP_SENSOR_ERROR           ||
   108		       temp == EC_TEMP_SENSOR_NOT_POWERED     ||
   109		       temp == EC_TEMP_SENSOR_NOT_CALIBRATED;
   110	}
   111	
   112	static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
   113	{
   114		return kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
   115	}
   116	
   117	static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
   118				      u32 attr, int channel, long *val)
   119	{
   120		struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
   121		int ret = -EOPNOTSUPP;
   122		u8 control_method;
   123		u8 pwm_value;
   124		u16 speed;
   125		u8 temp;
   126	
   127		if (type == hwmon_fan) {
   128			if (attr == hwmon_fan_input) {
   129				ret = cros_ec_hwmon_read_fan_speed(priv->cros_ec, channel, &speed);
   130				if (ret == 0) {
   131					if (cros_ec_hwmon_is_error_fan(speed))
   132						ret = -ENODATA;
   133					else
   134						*val = speed;
   135				}
   136			} else if (attr == hwmon_fan_fault) {
   137				ret = cros_ec_hwmon_read_fan_speed(priv->cros_ec, channel, &speed);
   138				if (ret == 0)
   139					*val = cros_ec_hwmon_is_error_fan(speed);
   140			}
   141		} else if (type == hwmon_pwm) {
   142			if (attr == hwmon_pwm_enable) {
   143				ret = cros_ec_hwmon_read_pwm_enable(priv->cros_ec, channel,
   144								    &control_method);
   145				if (ret == 0)
   146					*val = control_method;
   147			} else if (attr == hwmon_pwm_input) {
   148				ret = cros_ec_hwmon_read_pwm_value(priv->cros_ec, channel, &pwm_value);
   149				if (ret == 0)
   150					*val = pwm_value;
   151			}
   152		} else if (type == hwmon_temp) {
   153			if (attr == hwmon_temp_input) {
   154				ret = cros_ec_hwmon_read_temp(priv->cros_ec, channel, &temp);
   155				if (ret == 0) {
   156					if (cros_ec_hwmon_is_error_temp(temp))
   157						ret = -ENODATA;
   158					else
   159						*val = cros_ec_hwmon_temp_to_millicelsius(temp);
   160				}
   161			} else if (attr == hwmon_temp_fault) {
   162				ret = cros_ec_hwmon_read_temp(priv->cros_ec, channel, &temp);
   163				if (ret == 0)
   164					*val = cros_ec_hwmon_is_error_temp(temp);
   165			}
   166		}
   167	
   168		return ret;
   169	}
   170	
   171	static int cros_ec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
   172					     u32 attr, int channel, const char **str)
   173	{
   174		struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
   175	
   176		if (type == hwmon_temp && attr == hwmon_temp_label) {
   177			*str = priv->temp_sensor_names[channel];
   178			return 0;
   179		}
   180	
   181		return -EOPNOTSUPP;
   182	}
   183	
   184	static int cros_ec_hwmon_set_fan_pwm_val(struct cros_ec_device *cros_ec, u8 index, u8 val)
   185	{
   186		struct ec_params_pwm_set_fan_duty_v1 req = {
   187			.fan_idx = index,
   188			.percent = DIV_ROUND_CLOSEST((uint32_t)val * 100, 255),
   189		};
   190		int ret;
   191	
   192		ret = cros_ec_cmd(cros_ec, CROS_EC_HWMON_PWM_SET_FAN_DUTY_CMD_VERSION,
   193				  EC_CMD_PWM_SET_FAN_DUTY, &req, sizeof(req), NULL, 0);
   194		if (ret < 0)
   195			return ret;
   196		return 0;
   197	}
   198	
   199	static int cros_ec_hwmon_write_pwm_input(struct cros_ec_device *cros_ec, u8 index, u8 val)
   200	{
   201		u8 control_method;
   202		int ret;
   203	
   204		ret = cros_ec_hwmon_read_pwm_enable(cros_ec, index, &control_method);
   205		if (ret)
   206			return ret;
   207		if (control_method != 1)
   208			return -EOPNOTSUPP;
   209	
   210		return cros_ec_hwmon_set_fan_pwm_val(cros_ec, index, val);
   211	}
   212	
   213	static int cros_ec_hwmon_write_pwm_enable(struct cros_ec_device *cros_ec, u8 index, u8 val)
   214	{
   215		struct ec_params_auto_fan_ctrl_v2 req = {
   216			.fan_idx = index,
 > 217			.cmd = EC_AUTO_FAN_CONTROL_CMD_SET,
   218		};
   219		int ret;
   220	
   221		/* No CrOS EC supports no fan speed control */
   222		if (val == 0)
   223			return -EOPNOTSUPP;
   224	
   225		req.set_auto = (val != 1) ? true : false;
   226		ret = cros_ec_cmd(cros_ec, CROS_EC_HWMON_THERMAL_AUTO_FAN_CTRL_CMD_VERSION,
   227				  EC_CMD_THERMAL_AUTO_FAN_CTRL, &req, sizeof(req), NULL, 0);
   228		if (ret < 0)
   229			return ret;
   230		return 0;
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
