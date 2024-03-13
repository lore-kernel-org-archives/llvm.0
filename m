Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612413DBBA;
	Wed, 13 Mar 2024 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710332211; cv=none; b=s5dRCX0up2ui5Z0Ra/5Iq8+zJP1sysQhsMkoCQ7UfI9DdKDm0kCNhPJGVC5MnPrjZAjY5PmwjX5zGyfjQl28+RvxETZQERMulOPkwlieVf+VjjAkZ549ABvgtKX9J9dWqJ3tmzq/mGDQ9gjqfjQlPOr0HxbpOHFrUO51VbIwoV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710332211; c=relaxed/simple;
	bh=VUfzBGMO/FlpXxechvzdStq1VKd2cPkNETRA+bXOgzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dORU1en1LKs1w0saPVwIdUzrKG69QoeOhRFv6XVrl1RgY6xpdWLV1ceBSLqZVF41jFETZ/ZNMRGFo7FOVVcnRg9nCfNhcgs4WsSNROImamMSXtYgQlfbf4j4cyDNvjRIdAiKHBUe927gOpy5vScIxXsTIvoAWdeb1PPNOoAq1Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kd8mYBRq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kd8mYBRq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710332209; x=1741868209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VUfzBGMO/FlpXxechvzdStq1VKd2cPkNETRA+bXOgzo=;
  b=Kd8mYBRql1jP1ibG9t4kT6arxI+l+aMbyVgqjsCbisMh7eamQvh2VcZ2
   HhMVENc43xF0uHJLpOWwnMI3GFRUqFcx01yYAsglFG030o9Pp1kmZuG8o
   oUJFGZzQOA07hnjc3TA5LLOrctYbZ9rbvSDL3Adybsv8VAb7im/yWZisz
   J3qupJdQESfH5xQgRxC6b8MHuC4DhbVJ7xekGdzkZSSl3KN/gGwYkHJr6
   PrtUEYDRtoSPjZdFknEp/ImXgBbVXQvARNFO/Bpe1ilwOzk4hQmZAAWW9
   ahBLSxEJ+y3Y6IrjKgRNk9zmTBObac+OoIYo2fTI3N1vGkX5pJU4nSsnk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4956466"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="4956466"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 05:16:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="12354421"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Mar 2024 05:16:47 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkNXJ-000CM7-0L;
	Wed, 13 Mar 2024 12:16:45 +0000
Date: Wed, 13 Mar 2024 20:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [geoffreybennett-scarlett-gen2:vocaster 14/15]
 sound/usb/mixer_scarlett2.c:3680:6: warning: variable 'err' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202403132042.rQDVoEIP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/geoffreybennett/scarlett-gen2.git vocaster
head:   b78687f7243142a4466f63c0aee9742b44ee395d
commit: 33d7f6dc965ab09522361ec99745a0685e4b8272 [14/15] ALSA: scarlett2: Add autogain target controls
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240313/202403132042.rQDVoEIP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403132042.rQDVoEIP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403132042.rQDVoEIP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/usb/mixer_scarlett2.c:3680:6: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (private->autogain_updated) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett2.c:3690:9: note: uninitialized use occurs here
           return err;
                  ^~~
   sound/usb/mixer_scarlett2.c:3680:2: note: remove the 'if' if its condition is always true
           if (private->autogain_updated) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett2.c:3671:9: note: initialize the variable 'err' to silence this warning
           int err;
                  ^
                   = 0
   1 warning generated.


vim +3680 sound/usb/mixer_scarlett2.c

  3664	
  3665	static int scarlett2_ag_target_ctl_get(
  3666		struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
  3667	{
  3668		struct usb_mixer_elem_info *elem = kctl->private_data;
  3669		struct usb_mixer_interface *mixer = elem->head.mixer;
  3670		struct scarlett2_data *private = mixer->private_data;
  3671		int err;
  3672	
  3673		mutex_lock(&private->data_mutex);
  3674	
  3675		if (private->hwdep_in_use) {
  3676			err = -EBUSY;
  3677			goto unlock;
  3678		}
  3679	
> 3680		if (private->autogain_updated) {
  3681			err = scarlett2_update_autogain(mixer);
  3682			if (err < 0)
  3683				goto unlock;
  3684		}
  3685	
  3686		ucontrol->value.integer.value[0] = private->ag_targets[elem->control];
  3687	
  3688	unlock:
  3689		mutex_unlock(&private->data_mutex);
  3690		return err;
  3691	}
  3692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
