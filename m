Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223C218F2C3;
	Sun, 16 Feb 2025 12:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739708780; cv=none; b=tOPchrRBwOd1GSdTi78oTOxE2/dXR2KHuWx5fqxgReQv2KT4Udb6RzBujH93nmT2DCHBauSiTfWWyG65lpoklKBkVts2Cfmi9c04fBJRLsd8FnnrnRPshFMAHqwQ0Lo0JbI39sxKCXX5XbHPpbOCDIeRhcDtivcXJff7lQq50Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739708780; c=relaxed/simple;
	bh=a3CJYuvGwxaWxHj3kLfKsCfB3J9gYgLLPyJTIR6fEPE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=beKlLr1ukjuOjFVgAQ5ZToA9fasl47PJfV5bYBmrJX0LlC7sPh6c3hYwiPaHs+1C1WrDmMFRNvRGNyo5in3gaTTiEyfYZ5habQZNR2MH50mg4Z+sEZeACt1NQOy7FZKZtZvxCHH9hjdwuz7OGKhx5dpP9i/gRVym67ZO7C8KrZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFgfzJ3K; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFgfzJ3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739708778; x=1771244778;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=a3CJYuvGwxaWxHj3kLfKsCfB3J9gYgLLPyJTIR6fEPE=;
  b=kFgfzJ3KmeF2wmZRohmObimsR/RdCTjovyddcPKb/LsDEBxAViLoTBFS
   r7t4J+SZuDe6lyLaF2hdWAZDIDtff1HmNUygzs5cE404LHfF/rc1BCHAE
   w5NqMRA3BdOARkzBV3tTKe6v8KQWndon4mAzjMrYI8M5N+sdrUsHEc/V/
   ZRxo5Fbbit+AyjF45VQN0r7RGTJQ9eVXpw1l3orlK0zSVFMvsIyT7+VqL
   WJ0+T18vTgP7NMJNyZXjMw41pC5tzcAlD/LMLmdx3EsVuqM5NIvefa7iA
   8RySxShMRkFKlWZcMlsLIHqHsZemruVYoZ4oa6e1MCkPPCjsyeardD6I+
   g==;
X-CSE-ConnectionGUID: E1yCmdd8TOSzcrCt193fOg==
X-CSE-MsgGUID: kOai4oCcRqCTXrggV1NMyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="51028893"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="51028893"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 04:26:17 -0800
X-CSE-ConnectionGUID: WEKAKqXXQg6tTKJWKU+iOQ==
X-CSE-MsgGUID: /BbAP6oIRYm7p7WX/ePNgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144796361"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 04:26:17 -0800
Received: from abityuts-desk1.ger.corp.intel.com (abityuts-desk1.fi.intel.com [10.237.68.150])
	by linux.intel.com (Postfix) with ESMTP id 6958F20B5713;
	Sun, 16 Feb 2025 04:26:15 -0800 (PST)
Message-ID: <de5bf4f116779efde315782a15146fdc77a4a044.camel@linux.intel.com>
Subject: Re: [tip:x86/cpu 3/5] ERROR: modpost:
 "acpi_processor_ffh_play_dead" [drivers/acpi/processor.ko] undefined!
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: kernel test robot <lkp@intel.com>, Dave Hansen
 <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Date: Sun, 16 Feb 2025 14:26:14 +0200
In-Reply-To: <202502151207.FA9UO1iX-lkp@intel.com>
References: <202502151207.FA9UO1iX-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2025-02-15 at 12:51 +0800, kernel test robot wrote:
> tree:=C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip=
.git=C2=A0x86/cpu
> head:=C2=A0=C2=A0 96040f7273e2bc0be1871ad9ed4da7b504da9410
> commit: 541ddf31e30022b8e6f44b3a943964e8f0989d15 [3/5] ACPI/processor_idl=
e: Add FFH state handling
> config: x86_64-randconfig-077-20250214 (https://download.01.org/0day-ci/a=
rchive/20250215/202502151207.FA9UO1iX-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project=C2=
=A0ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250215/202502151207.FA9UO1iX-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202502151207.FA9UO1iX-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> > > ERROR: modpost: "acpi_processor_ffh_play_dead" [drivers/acpi/processo=
r.ko] undefined!

Oh, this is the 'CONFIG_ACPI_PROCESSOR=3Dm' case. The function export is mi=
ssing. Sorry for this.

The below patch fixes the issue. Could you please fold it into the followin=
g commit?

	541ddf31e300 ACPI/processor_idle: Add FFH state handling

I am not sure about the rules of the tip tree in cases like this, please di=
rect me on
how to handle the delivery of the fix.

Thanks!


index 5bdb65516969..86c87c01d23d 100644
--- a/arch/x86/kernel/acpi/cstate.c
+++ b/arch/x86/kernel/acpi/cstate.c
@@ -214,6 +214,7 @@ void acpi_processor_ffh_play_dead(struct acpi_processor=
_cx *cx)
        percpu_entry =3D per_cpu_ptr(cpu_cstate_entry, cpu);
        mwait_play_dead(percpu_entry->states[cx->index].eax);
 }
+EXPORT_SYMBOL_GPL(acpi_processor_ffh_play_dead);
=20
 void __cpuidle acpi_processor_ffh_cstate_enter(struct acpi_processor_cx *c=
x)
 {



