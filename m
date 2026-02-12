Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0070F27467E;
	Thu, 12 Feb 2026 09:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889500; cv=none; b=kxfXT6iHbCafRWfG9WGsgx0NmQ9DlpAaruYkom1gdo+ZGX84nPGaJapqyrkB4lfs1WQSsnWiOKW/GGKCI0WyT2UIVqAmmWdoSxfGnhB53OQdJ0s02QUjnf3ShbM6/3f4Ub0wfGDnzadfzgue2PvGz2oDJndx+PjR6vyldeSnVrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889500; c=relaxed/simple;
	bh=YsxgldphmWO694HgD46MlSot+OU+xO8O4VJplMZosF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVYrlqqyDIDUgfnMtIf7HowIYQw78GcvWZd4lXIV9QgKYN9OtyLO+cPQ+2nliaj900JUCRBJRP/JO5/gA8UAKQwj1FnsThAV2g/rDXKdN7ItxgARTdu8r+HfiuyzcndIfq+uaQajWQCMOC6bw6LQrQDNejY9DFV+0pIwbPdLbrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Y49CTFPQ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Y49CTFPQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=833/EZZPoRCNa1CzduKQIDoSq5Xvt+n4Hursud2AlLM=; b=Y49CTFPQsx4CSTnl8tDE/haZBZ
	Fbl6Ojbi3QC0qEIUQ0oi6xQsLR4nJjD6AGDaF3CXNOsXokkKVAjX0bAnYRXNHjh/fxsMKj8Rm1RhR
	qgSr11cR1/kF9GR/G9SM5BsepG9vWLiX8OIQD8Ljx4YODmZJefSpSVzybv1otFe7UiLXZAxul0EIf
	c8+VjbsbPk1EpveDQvWoXliNkPsvYYb7SaJBveLdpMyoQbLbPIgr+BoEVLiBGL1Di0cmJnMCvEmxf
	pVesWdln762VUEvO/cJA2rVGFxbDhTlwEqjGBo0dEOIcnfe+fNYstm85adBG7Qn+7cks3L0C+GnyJ
	NmWhUeSw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vqTFZ-00HSoJ-EY; Thu, 12 Feb 2026 10:44:41 +0100
Message-ID: <d5fa40db-c9cc-4dda-8bff-c2f98d7bc421@igalia.com>
Date: Thu, 12 Feb 2026 09:44:40 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/31] drm/sched: Add some scheduling quality unit
 tests
To: phasta@kernel.org, kernel test robot <lkp@intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20260128110806.38350-7-tvrtko.ursulin@igalia.com>
 <202601292335.YI2PBzhs-lkp@intel.com>
 <ef514066e5771e8ac1deb3ae6baa14b798305fd2.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <ef514066e5771e8ac1deb3ae6baa14b798305fd2.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/02/2026 10:56, Philipp Stanner wrote:
> On Thu, 2026-01-29 at 23:31 +0800, kernel test robot wrote:
>> Hi Tvrtko,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on drm-misc/drm-misc-next]
>> [also build test ERROR on drm-xe/drm-xe-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v6.19-rc7 next-20260128]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> Hi Tvrtko,
> 
> what about this build error? Seems to be an Xe branch conflict?

I don't know what happened there in LKP, it appeared for the first time 
with v6. Drm_sched_scheduler_two_clients_attr looks constant to me:

static const struct kunit_attributes 
drm_sched_scheduler_two_clients_attr = {
	.speed = KUNIT_SPEED_SLOW,
};

static struct kunit_case drm_sched_scheduler_two_clients_tests[] = {
	KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_two_clients_test,
			      drm_sched_scheduler_two_clients_gen_params,
			      drm_sched_scheduler_two_clients_attr),
	{}
};

It builds fine for me but I will keep an eye on it.

> BTW, I think Danilo and I told you a few times already that we would
> like to get the whole patch series into our inboxes. You seem to
> exclude patches for other components, but it's important for me to see
> all the other driver maintainers' RBs etc. there and be easily able to
> ping those who haven't reacted yet and so on. Also quickly coyping an
> mbox to test-apply something etc. etc. is easier
> 
> I guess you want to spare people from noisy mail traffic, but getting
> 31 patches is not a problem, those who don't care can simple ignore
> them or collapse the thread in their mail program and so on.

I assume all important people are subscribed to dri-devel anyway so all 
patches should be in their inboxes. But I will try and remember to 
explicitly cc you two.

Regards,

Tvrtko

>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-amdgpu-Reject-impossible-entities-early/20260128-191117
>> base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
>> patch link:    https://lore.kernel.org/r/20260128110806.38350-7-tvrtko.ursulin%40igalia.com
>> patch subject: [PATCH v6 06/31] drm/sched: Add some scheduling quality unit tests
>> config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260129/202601292335.YI2PBzhs-lkp@intel.com/config)
>> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601292335.YI2PBzhs-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202601292335.YI2PBzhs-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/gpu/drm/scheduler/tests/tests_scheduler.c:676:10: error: initializer element is not a compile-time constant
>>                                   drm_sched_scheduler_two_clients_attr),
>>                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/kunit/test.h:224:13: note: expanded from macro 'KUNIT_CASE_PARAM_ATTR'
>>                       .attr = attributes, .module_name = KBUILD_MODNAME}
>>                               ^~~~~~~~~~
>>     1 error generated.
>>
>>
>> vim +676 drivers/gpu/drm/scheduler/tests/tests_scheduler.c
>>
>>     672	
>>     673	static struct kunit_case drm_sched_scheduler_two_clients_tests[] = {
>>     674		KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_two_clients_test,
>>     675				      drm_sched_scheduler_two_clients_gen_params,
>>   > 676				      drm_sched_scheduler_two_clients_attr),
>>     677		{}
>>     678	};
>>     679	
>>
> 

