Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050B61DF26E;
	Fri, 10 Oct 2025 06:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760076436; cv=none; b=B5veY1PafNKPlETMP7fVGPG1vSiRAWjwQfyVpI7L8AY9a+ch42jJ/+PKBSO5IEhCduRnR441CUH9yExiMt06GnKkQSozS37C8zMwPUwK08suD8g/bZp6q75SSXMe+lyjvPuYskrSXPMDtv6IvrrwBH5sQpqTyFSGiGPLdrv9ZQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760076436; c=relaxed/simple;
	bh=WJdYbEdswEL2qtCJ2STUf7ntn6Iq6i8d56dp1sDUz3Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2By76P9WlbxGyEgDrwlmdenvc/hzxijJkeFChSkCZEdax8b8qBthRnOU28pBvS+i2Serv1K9CrJAvbntWfmpGh6YCXRAi8u1rU/MEg6gRq8j+SzIp2wQzVJ3vX/keAGFyepSGpDrtm2xyIPHA7A6nwhWxeaonH5fc/joYtODVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=ivy9RZH2; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="ivy9RZH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1760076435; x=1791612435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=WJdYbEdswEL2qtCJ2STUf7ntn6Iq6i8d56dp1sDUz3Q=;
  b=ivy9RZH2srAKXKhggr1xe6Jv0yaaO2BUIcZG6+MGIyWOLGJbVD/dTi5l
   TWY6+8BSgEUSusdzgUXfR5MQguV692yWz6UESafBjmog4SmZphTSUikDo
   qzLUt49+Fn/WzvLpoelm2lALTrR2KA212MBSZEQ+SGp7UfnaXJboLr2KE
   VxrjtPNtYsGmTK3+9OzcLBC4nw8hxYdIEBpVLzMOkCDGiMYoTZCydkPBo
   u91IH+a5+eafzkAwJrSVlO6QNgotIiGyOYWVKZSUbvztlY1Tw2H+S/xdr
   wDmlw1r5ezrkEDIRkoH7zuSTVe94yo/+dzScqKY+y5QMVyRZ0uG1MA75T
   Q==;
X-CSE-ConnectionGUID: +GroEsTKQluxlXnMqrVBhA==
X-CSE-MsgGUID: mAboILn4T3iTSWY6Z0Jzvg==
X-IronPort-AV: E=Sophos;i="6.19,218,1754956800"; 
   d="scan'208";a="4447007"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 06:07:12 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.7.35:42599]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.15.171:2525] with esmtp (Farcaster)
 id bd58cc9d-fc6e-4c2e-8deb-efc1ee480171; Fri, 10 Oct 2025 06:07:12 +0000 (UTC)
X-Farcaster-Flow-ID: bd58cc9d-fc6e-4c2e-8deb-efc1ee480171
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 10 Oct 2025 06:07:12 +0000
Received: from dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com
 (172.19.75.107) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Fri, 10 Oct 2025
 06:07:10 +0000
Date: Fri, 10 Oct 2025 06:07:08 +0000
From: Jakub Acs <acsjakub@amazon.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>, kernel test robot
	<lkp@intel.com>, <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value
 `VM_READ` in crate `bindings`
Message-ID: <20251010060618.GA80465@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
References: <202510100127.yuqhg8uo-lkp@intel.com>
 <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
 <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: EX19D046UWA002.ant.amazon.com (10.13.139.39) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Transfer-Encoding: base64

T24gVGh1LCBPY3QgMDksIDIwMjUgYXQgMDg6MTQ6MDFQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIFRodSwgT2N0IDksIDIwMjUgYXQgODowNeKAr1BNIEFuZHJldyBNb3J0b24gPGFr
cG1AbGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4KPiA+IEFsaWNlLCBNaWd1ZWwsIHBs
ZWFzZSByZW1pbmQgd2hhdCB0byBkbyBhYm91dCB0aGlzPwo+IAo+IFdlIGNhbiBlaXRoZXIgZGVm
aW5lIGhlbHBlciBjb25zdGFudHMgaW4KPiBgcnVzdC9iaW5kaW5ncy9iaW5kaW5nc19oZWxwZXIu
aGAgZm9yIHRoZSBvbmVzIHRoYXQgdGhlIFJ1c3Qgc2lkZSBpcwo+IGFscmVhZHkgdXNpbmcgKGxp
a2UgbGFzdCB0aW1lKSBvciB1c2UgYGVudW1gcyBvbiB0aGUgQyBoZWFkZXIuCgpGV0lXIEFsaWNl
IHN1Z2dlc3RlZCB0aGUgZW51bSB2ZXJzaW9uIGFuZCB3ZSBkaXNjdXNzZWQgYWRqdXN0bWVudCB0
byB0aGUKcGF0Y2ggaW4gdGhyZWFkIFsxXS4gSSB3YXMgZ29pbmcgdG8gc2VuZCBuZXcgdmVyc2lv
biBvZiB0aGUgcGF0Y2ggYXMKc29vbiBhcyBJIGZpZ3VyZSBvdXQgaG93IHRvIHRlc3QgZm9yIHRo
ZSBpc3N1ZSBwb2ludGVkIG91dCBieSBEZXJyaWNrIGluClsyXS4KClBsZWFzZSBsZXQgbWUga25v
dyBpZiB0aGF0IGlzIGRlc2lyZWQgb3Igd2hldGhlciB5b3UncmUgdGFraW5nIGNhcmUgb2YKaXQg
aGVyZS4gQW5kL29yIGhvdyBlbHNlIEkgY2FuIGhlbHAuCgoKWzFdOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNTEwMDgxMjU0MjcuNjg3MzUtMS1hY3NqYWt1YkBhbWF6b24uZGUvClsy
XTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMDA3MTcwMTU2LkdRMTU4NzkxNUBm
cm9nc2Zyb2dzZnJvZ3MvCgpUaGFua3MsCkpha3ViCgoKCkFtYXpvbiBXZWIgU2VydmljZXMgRGV2
ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApUYW1hcmEtRGFuei1TdHIuIDEzCjEwMjQzIEJl
cmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIKRWluZ2V0cmFnZW4g
YW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDI1Nzc2NCBCClNpdHo6IEJl
cmxpbgpVc3QtSUQ6IERFIDM2NSA1MzggNTk3Cg==

