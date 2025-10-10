Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B811F63CD;
	Fri, 10 Oct 2025 07:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760082312; cv=none; b=VSEauiDlinaeBad5jnKT0dhMsLo1rxxaqslhi8KPhprCYm6n4T1UoQ5nHhFWTWcbVMdkn0dyvjgIr4HibfycwzgnB6tsALYft8NTzXiXd2YkwezxDK305xc+a8lgSqMYxOUI7A7h3eKKFqs6+GYB09OCJJBH+nmpSnZvHtcIfi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760082312; c=relaxed/simple;
	bh=l0oz5e0o8tACYdNARzq7pIphjfhSwpUbI/5pz+rfEhc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2zSBwTu9AxYnsDKpqP2uwnvTEUr4ZQX5pXulDPX7+7kVpkapL8X/0kTX/mbPzZCY5eyKiFN7ZUFIurdNBar+0AHgqXW17f9zkBgRL6wknDFYWgDL4dX+NgMop3LKJBcwl+bcMzotKRMAJNB0Gnor/OzZEAdect7PkFfpsQoPLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=BsJISQb4; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="BsJISQb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1760082310; x=1791618310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=l0oz5e0o8tACYdNARzq7pIphjfhSwpUbI/5pz+rfEhc=;
  b=BsJISQb4zr7ElAWyGL5KzIftVGHntmROJxM2dniScQv2qsJnbuyDN/2p
   u776F/+0QV915gJFSho092fTnAoiGyWO0rjqIIQE1XDNezwAhMf7+Pp7C
   tPqiaT2h1ni5QncZ2EqQzs5jn5Jr6KmAOCUAdOgDrs90bCrmj8llvcWMt
   XwFn1nEGrdYvql1sICm/P2ZaErNOlTpOwksphPQoSqtOi37YkrowoXvvW
   IFTzb7b/fdyzgYW2pR4OWFGPj/If72RI3ZdNNHCDH+MjEEYBSzgIhH090
   ld904bBQquQad+TF3YtvUDRbX/coUuLPPuOMpBYWh6E3JhJK2mrrX6SkX
   A==;
X-CSE-ConnectionGUID: 1f6E/2q+TmO2qwnCdW7GDQ==
X-CSE-MsgGUID: 4tIHy7hpSKKp2C7U4pgYZg==
X-IronPort-AV: E=Sophos;i="6.18,281,1751241600"; 
   d="scan'208";a="4653589"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 07:45:04 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:50702]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.171:2525] with esmtp (Farcaster)
 id adeac70d-a4e1-4e41-a68c-ef2545172203; Fri, 10 Oct 2025 07:45:04 +0000 (UTC)
X-Farcaster-Flow-ID: adeac70d-a4e1-4e41-a68c-ef2545172203
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 10 Oct 2025 07:45:02 +0000
Received: from dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com
 (172.19.75.107) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Fri, 10 Oct 2025
 07:45:01 +0000
Date: Fri, 10 Oct 2025 07:44:58 +0000
From: Jakub Acs <acsjakub@amazon.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>, kernel test robot
	<lkp@intel.com>, <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value
 `VM_READ` in crate `bindings`
Message-ID: <20251010074458.GA91144@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
References: <202510100127.yuqhg8uo-lkp@intel.com>
 <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
 <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com>
 <20251010060618.GA80465@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
 <CANiq72kndiqwEm-OZLd6JumAaBy7KrzYf_rDjwhtw5Uh4vdTCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CANiq72kndiqwEm-OZLd6JumAaBy7KrzYf_rDjwhtw5Uh4vdTCg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: EX19D042UWA002.ant.amazon.com (10.13.139.17) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Transfer-Encoding: base64

T24gRnJpLCBPY3QgMTAsIDIwMjUgYXQgMDg6NTk6MDZBTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIEZyaSwgT2N0IDEwLCAyMDI1IGF0IDg6MDfigK9BTSBKYWt1YiBBY3MgPGFjc2ph
a3ViQGFtYXpvbi5kZT4gd3JvdGU6Cj4gPgo+ID4gRldJVyBBbGljZSBzdWdnZXN0ZWQgdGhlIGVu
dW0gdmVyc2lvbiBhbmQgd2UgZGlzY3Vzc2VkIGFkanVzdG1lbnQgdG8gdGhlCj4gPiBwYXRjaCBp
biB0aHJlYWQgWzFdLiBJIHdhcyBnb2luZyB0byBzZW5kIG5ldyB2ZXJzaW9uIG9mIHRoZSBwYXRj
aCBhcwo+ID4gc29vbiBhcyBJIGZpZ3VyZSBvdXQgaG93IHRvIHRlc3QgZm9yIHRoZSBpc3N1ZSBw
b2ludGVkIG91dCBieSBEZXJyaWNrIGluCj4gPiBbMl0uCj4gPgo+ID4gUGxlYXNlIGxldCBtZSBr
bm93IGlmIHRoYXQgaXMgZGVzaXJlZCBvciB3aGV0aGVyIHlvdSdyZSB0YWtpbmcgY2FyZSBvZgo+
ID4gaXQgaGVyZS4gQW5kL29yIGhvdyBlbHNlIEkgY2FuIGhlbHAuCj4gCj4gVGhlIGBlbnVtYCBh
cHByb2FjaCBpcyB3aGF0IHdlIHVzdWFsbHkgc3VnZ2VzdCBpZiBwb3NzaWJsZSwgYW5kIGluCj4g
dGhpcyBjYXNlIGl0IGFsc28gYXZvaWRzIGhhdmluZyB0byByZXBsaWNhdGUgY29uZGl0aW9uYWwg
Y29tcGlsYXRpb24KPiBvbiB0aGUgUnVzdCBzaWRlLCB3aGljaCBpcyBnb29kLgo+IAo+IEhvd2V2
ZXIsIHVzaW5nIGl0IGhlcmUgYXMtaXMgbWVhbnMgdGhlIHJlc3VsdGluZyB0eXBlIG9mCj4gYFZN
X01FUkdFQUJMRWAgaXMgYHVuc2lnbmVkIGludGAsIG5vdCBgdW5zaWduZWQgbG9uZ2AgLS0gYnV0
IHdhc24ndAo+IHRoYXQgYW4gaXNzdWU/IGkuZS4KPiAKPiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjUwOTMwMTMwMDIzLjYwMTA2LTEtYWNzamFrdWJAYW1hem9uLmRlLwo+IAoK
VGhpcyBpcyBhIHRyaWNreSBvbmUgLSBWTV9NRVJHRUFCTEUgYmVpbmcgYHVuc2lnbmVkIGludGAg
aXMgb25seSBhbiBpc3N1ZQppZiB0aGVyZSBhcmUgZmxhZ3MgdXNpbmcgYW55IG9mIHRoZSB1cHBl
ciAzMiBiaXRzLiBBbmQgaWYgdGhhdCBpcyB0aGUKY2FzZSwgQ09ORklHX0FSQ0hfVVNFU19ISUdI
X1ZNQV9GTEFHUyBoYXMgdG8gYmUgJ3knLCAtPiB0aHVzIHRoZSBlbnVtCndpbGwgYWxzbyBoYXZl
IEJJVCgzMyksIEJJVCgzNCksIGFuZCBzbyBvbi4gU28gZnJvbSB0aGF0IHBlcnNwZWN0aXZlCndl
J3JlIG9rIChjaGVja2VkIGJ5IHJ1bm5pbmcgYSByZXByb2R1Y2VyKS4KCj4gV2UgbWF5IGJlIGFi
bGUgdG8gdXNlIGEgZHVtbXkgbGFyZ2VyIGNvbnN0YW50IHRvIGZvcmNlIHRoZSBjb21waWxlciB0
bwo+IHBpY2sgYSBiaWdnZXIgdW5kZXJseWluZyB0eXBlLCBlLmcuIHNvbWV0aGluZyBsaWtlOgo+
IAo+ICAgICBfX1ZNX0ZMQUdTX0ZPUkNFX1VMICAgID0gQklUKDYzKSwKPiAKPiBCdXQgbm90ZSB0
aGF0IG9sZGVyIHZlcnNpb25zIG9mIEdDQyBhbmQgQ2xhbmcga2VlcCB0aGUgc21hbGxlciBgZW51
bWAKPiBjb25zdGFudHMgYXMgYGludGAgKGkuZS4gc21hbGwgYW5kIHNpZ25lZCksIGV2ZW4gaWYg
dGhleSB3aWxsIHBpY2sKPiBgdW5zaWduZWQgbG9uZ2AgZm9yIHRoZSBiaWdnZXIgb25lcy4gTmV3
ZXIgdmVyc2lvbnMgd2lsbCBwaWNrCj4gYHVuc2lnbmVkIGxvbmdgIGZvciBhbGwuCj4gCj4gVGhl
IGJlc3Qgd291bGQgYmUgdG8gdXNlIEMyMy1saWtlIGBlbnVtIDogdW5zaWduZWQgbG9uZyB7IC4u
LiB9YCwgYnV0Cj4gc2FkbHkgd2UgZG9uJ3QgaGF2ZSBhIHJlY2VudCBlbm91Z2ggR0NDIGFzIGEg
bWluaW11bSBpbiB0aGUga2VybmVsCj4gKEdDQyAxMykuCj4gCj4gSWYgdGhlcmUgYXJlIGV4dHJh
IGNvbXBsaWNhdGlvbnMgd2l0aCB0aGUgYGVudW1gIGFwcHJvYWNoIChpLmUuIHNlY29uZAo+IGxp
bmspLCB0aGVuIHBlcmhhcHMganVzdCByZXBsaWNhdGluZyBpdCBvbiB0aGUgUnVzdCBzaWRlIGlz
IHNpbXBsZXIuCj4gCgpUaGlzIG9mYyByZW1haW5zIHRydWUsIEknbSBub3QgeWV0IHN1cmUgaG93
IHRvIHRlc3QgdGhhdCBjb21wbGljYXRpb24uCgpUaGFua3MsCkpha3ViCgoKCkFtYXpvbiBXZWIg
U2VydmljZXMgRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApUYW1hcmEtRGFuei1TdHIu
IDEzCjEwMjQzIEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIK
RWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDI1Nzc2
NCBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDM2NSA1MzggNTk3Cg==

