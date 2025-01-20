Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F23D1E8824;
	Mon, 20 Jan 2025 15:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387350; cv=none; b=jC6cFW3Zqy4lRvxORKUy2JuJ/sK0MySC2SzecP+6Ce3eCtnJtItCV7aa8K/PORRygKWmn7v0nHS7qNvzc/DSK5pjg2AbUMO5XUTVfTnTKiiY/7S5LuM1CoOkkI3mQY32VcckqjYCesVscq7huQ2zhTnuB35ufah3HgFphaAkClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387350; c=relaxed/simple;
	bh=I7bIKhsocAJvq8kJhvR5mhaF96B0qKLrs0s1jPkJyJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dM8sblbdWXEUnbYMkobXGUKfIgbM2DI4949YCU+VRa/HFi99kuk7zsbDV5QPaUae4L2vMmwIicS5ySKE2DZ0TmFnfwpJ5k6IUel0Ka2vXnNCikRjTgZGeKIX0APQY3aVv1G5OXwh0MolYvWhbzmteMQDHEltD/7hMX4RU01kVvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 469AE1063;
	Mon, 20 Jan 2025 07:36:10 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A81703F740;
	Mon, 20 Jan 2025 07:35:40 -0800 (PST)
Date: Mon, 20 Jan 2025 15:35:37 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel test robot <lkp@intel.com>,
	Sudeep Holla <sudeep.holla@arm.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 9185/10024]
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to
 reserved register 'R7'
Message-ID: <Z45tSadT6TxsuD_h@bogus>
References: <202501201840.XmpHXpQ4-lkp@intel.com>
 <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
 <CAPDyKFqrvPr0NXtgfsY1SdVCeEZOghheXnuncN=QzbF_VxftGw@mail.gmail.com>
 <Z45Q9zJ8mvE_ut2R@bogus>
 <CA+_ehUzNMb2sGALem+Y3eDnJVPRTryybKGVja5QmC8u0_KagsA@mail.gmail.com>
 <Z45TSqieqbzufJWS@bogus>
 <CA+_ehUzBBCwaoLRfm+eQ_DC=JwGRGJ_+cn2TeuOtD51Z97ER8A@mail.gmail.com>
 <Z45mOFHZM75VLZ-g@bogus>
 <CA+_ehUwnWdi7bG-Dzc3iv=VTA8bwEpRXP9_iQVOb5=uDqqrRRw@mail.gmail.com>
 <CA+_ehUyVH5r5LK5B2tKZgH_dR69OVaV-ES7+GPShNuJCWEXHVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUyVH5r5LK5B2tKZgH_dR69OVaV-ES7+GPShNuJCWEXHVA@mail.gmail.com>

On Mon, Jan 20, 2025 at 04:28:08PM +0100, Christian Marangi (Ansuel) wrote:
>
> Honestly I will revert back and use the basic arm_smccc_smc. I don't really like
> the fix in the makefile and I think it should be handled in a more
> generic way for any user of arm_smccc_1_1_invoke.

You can use arm_smccc_smc() or arm_smccc_hvc() if that works for you.
If the system supports SMCCC v1.1+, then arm_smccc_1_1_invoke() helper
provides a generic and portable way(switch between the conduits if
running within a VM for example)

--
Regards,
Sudeep
