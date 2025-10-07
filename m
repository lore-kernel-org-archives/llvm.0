Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4B135959;
	Tue,  7 Oct 2025 07:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.12.53.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759820846; cv=none; b=gxo1WwH3Ao/79wU44UUWtIgQvOC8QO8BED8aHqKBhNFAVrrURJf0bQHKkDu9b8xDIskmKqNYgYjf4dECrZdzpLPNPS9LFgNoPeZYk5TAdbxSBB6wLmGOeWENTn6qQV2PGLzh76EkWHagrijtE9aO8DcVfD0BXTUL76MMno/OV3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759820846; c=relaxed/simple;
	bh=PRhaLNGyZU7w5yRcM/FXYdLrSM4H89YmLx4vMGpLR80=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ul++W7gK8lAGtws8Ss3Nz3ROyOpLFUHSyo4d5CPOdQ7Ff6ff8D8XhkWJyYpnsBlhS8GXVBgltzAWOYOOrqi6ERpWFwgn7YsfQc8kh+99tJR3iNFghUbWD7uAAOxcRguoKjG+kKPqUwOnnJ60UtNUzNSxixqtpjMVMgIKJZen6PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=bcr8EaXr; arc=none smtp.client-ip=52.12.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="bcr8EaXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1759820841; x=1791356841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=PRhaLNGyZU7w5yRcM/FXYdLrSM4H89YmLx4vMGpLR80=;
  b=bcr8EaXraDk1v1NXYAqOadA/qRHYYU+MPAaYg92Xl15g2S448WBihGoj
   dIG9bOov+hKF65DJlQ80Es4z7U1C0bnv2kCFAYYu2dSXukwpn3uQsmPZ+
   q3KRH71cpoUv82S++uJ5aNahF7G1Ayi56g+ctv3+ALRo6PhrBvZi4OTUy
   uksvA1NqdDDQXwfHCcHJSmXWTA9IIwUeiSU7iFmSpaxIUe7drOwZxSIcs
   kKjKwgfhG8GCtwY+9aH37w/yJ6omDqRytpMi1qK7pRsoxyOoZ2MbSEyLv
   JoDLaVme8RhUkWzVqHD0Dxv/TCR/OyIvliLFzu339rjMgBohPs7/l4jiU
   g==;
X-CSE-ConnectionGUID: cPL34nEPQyC4pIgpm4tsig==
X-CSE-MsgGUID: 7S4WtF34QK6dV8dXaOE8Yw==
X-IronPort-AV: E=Sophos;i="6.18,321,1751241600"; 
   d="scan'208";a="4313107"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 07:07:19 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.38.20:63969]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.35.225:2525] with esmtp (Farcaster)
 id 99f6e941-b7d0-4ce2-94cd-e7e14d176133; Tue, 7 Oct 2025 07:07:19 +0000 (UTC)
X-Farcaster-Flow-ID: 99f6e941-b7d0-4ce2-94cd-e7e14d176133
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 7 Oct 2025 07:07:18 +0000
Received: from dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com
 (172.19.75.107) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Tue, 7 Oct 2025
 07:07:17 +0000
Date: Tue, 7 Oct 2025 07:07:14 +0000
From: Jakub Acs <acsjakub@amazon.de>
To: John Hubbard <jhubbard@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda
	<miguel.ojeda.sandonis@gmail.com>, kernel test robot <lkp@intel.com>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, "Linux Memory
 Management List" <linux-mm@kvack.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
Message-ID: <20251007070611.GA88971@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
References: <202510030449.VfSaAjvd-lkp@intel.com>
 <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
 <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
 <CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com>
 <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
 <cd2ea7d4-6b12-4933-b1ae-cd4db18d3671@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <cd2ea7d4-6b12-4933-b1ae-cd4db18d3671@nvidia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: EX19D039UWA002.ant.amazon.com (10.13.139.32) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Transfer-Encoding: base64

T24gVGh1LCBPY3QgMDIsIDIwMjUgYXQgMDU6MjQ6NDhQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDEwLzIvMjUgMzo0MyBQTSwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPiA+IE9uIEZy
aSwgMyBPY3QgMjAyNSAwMDozOToxNiArMDIwMCBNaWd1ZWwgT2plZGEgPG1pZ3VlbC5vamVkYS5z
YW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOgo+ID4+IE9uIEZyaSwgT2N0IDMsIDIwMjUgYXQgMTI6
MjfigK9BTSBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToK
PiAuLi4KPiA+IEZyb206IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+
Cj4gPiBTdWJqZWN0OiBtbS1rc20tZml4LWZsYWctZHJvcHBpbmctYmVoYXZpb3ItaW4ta3NtX21h
ZHZpc2UtZml4Cj4gPiBEYXRlOiBUaHUgT2N0ICAyIDAzOjM3OjQ3IFBNIFBEVCAyMDI1Cj4gPiAK
PiA+IFJ1c3QgYmluZGdlbiB3YXNuJ3QgYWJsZSB0byBoYW5kbGUgdGhlIEJJVCgpIG1hY3JvLiAg
QWRkIGEgaGVscGVyIChmcm9tCj4gPiBNaWd1ZWwpIHRvIGZpeCB0aGlzLgo+ID4gCj4gPiBSZXBv
cnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gPiBDbG9zZXM6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNTEwMDMwNDQ5LlZmU2FBanZk
LWxrcEBpbnRlbC5jb20vCj4gPiBDYzogQXhlbCBSYXNtdXNzZW4gPGF4ZWxyYXNtdXNzZW5AZ29v
Z2xlLmNvbT4KPiA+IENjOiBDaGVuZ21pbmcgWmhvdSA8Y2hlbmdtaW5nLnpob3VAbGludXguZGV2
Pgo+ID4gQ2M6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+ID4gQ2M6IEph
a3ViIEFjcyA8YWNzamFrdWJAYW1hem9uLmRlPgo+ID4gQ2M6IFBldGVyIFh1IDxwZXRlcnhAcmVk
aGF0LmNvbT4KPiA+IENjOiBTZW9uZ0phZSBQYXJrIDxzakBrZXJuZWwub3JnPgo+ID4gQ2M6IFh1
IFhpbiA8eHUueGluMTZAenRlLmNvbS5jbj4KPiA+IENjOiBNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+Cj4gPiBDYzogQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdv
b2dsZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZv
dW5kYXRpb24ub3JnPgo+ID4gLS0tCj4gPiAKPiA+ICBydXN0L2JpbmRpbmdzL2JpbmRpbmdzX2hl
bHBlci5oIHwgICAgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAK
PiA+IC0tLSBhL3J1c3QvYmluZGluZ3MvYmluZGluZ3NfaGVscGVyLmh+bW0ta3NtLWZpeC1mbGFn
LWRyb3BwaW5nLWJlaGF2aW9yLWluLWtzbV9tYWR2aXNlLWZpeAo+ID4gKysrIGEvcnVzdC9iaW5k
aW5ncy9iaW5kaW5nc19oZWxwZXIuaAo+ID4gQEAgLTk5LDMgKzk5LDQgQEAgY29uc3QgeGFfbWFy
a190IFJVU1RfQ09OU1RfSEVMUEVSX1hBX1BSRQo+ID4gIAo+ID4gIGNvbnN0IGdmcF90IFJVU1Rf
Q09OU1RfSEVMUEVSX1hBX0ZMQUdTX0FMTE9DID0gWEFfRkxBR1NfQUxMT0M7Cj4gPiAgY29uc3Qg
Z2ZwX3QgUlVTVF9DT05TVF9IRUxQRVJfWEFfRkxBR1NfQUxMT0MxID0gWEFfRkxBR1NfQUxMT0Mx
Owo+ID4gK2NvbnN0IHZtX2ZsYWdzX3QgUlVTVF9DT05TVF9IRUxQRVJfVk1fTUVSR0VBQkxFID0g
Vk1fTUVSR0VBQkxFOwo+ID4gXwo+IAo+IFllcywgdGhpcyBmaXhlcyB0aGUgYnVpbGQgb24gbXkg
c3lzdGVtIHRvbywgc286Cj4gCj4gVGVzdGVkLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+Cj4gCj4gLi4ub2YgY291cnNlLCB3ZSdsbCBoYXZlIHRvIHVuZG8gdGhpcyBsYXRl
ciwgYXMgcGFydCBvZiB0aGUgZml4Cj4gZm9yIHRoZSBSdXN0IGZvciBMaW51eCBidWlsZCBzeXN0
ZW0sIHRvIGhhbmRsZSBCSVQoKSBhbmQgc2ltaWxhcgo+IG1hY3JvcyBpbiBiaW5kZ2VuLgo+IAoK
SGksIAoKc29ycnkgZm9yIHRoZSBpc3N1ZXMgdGhpcyBoYXMgY2F1c2VkLiBXZSdyZSBhbHNvIGNo
YW5naW5nIHRoZSBvdGhlcgpkZWZpbmVzIHRvIEJJVCgpIGZvciBjb25zaXN0ZW5jeSwgaXQgd2Fz
IGFwcGxpZWQgdG8gbW0tbmV3IGluIFsxXS4gSQphc3N1bWUgdGhpcyB3aWxsIGhhdmUgdGhlIHNh
bWUgYnJlYWtpbmcgZWZmZWN0LiBOb3Qgc3VyZSB3aGF0IGlzIHRoZQpzb2x1dGlvbiAtIHdoZXRo
ZXIgdG8gd2FpdCBmb3IgdGhlIGZpeCBtZW50aW9uZWQgYnkgSm9obiBvciBhZGQgc2ltaWxhcgpk
ZWZpbnRpb25zIHRvIGEvcnVzdC9iaW5kaW5ncy9iaW5kaW5nc19oZWxwZXIuaCBmb3IgYWxsIGNv
bnN0cz8KClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMDAyMjAyMTEyLkMy
MjkzQzRDRUY0QHNtdHAua2VybmVsLm9yZy8KCktpbmQgUmVnYXJkcywKSmFrdWIKCgoKQW1hem9u
IFdlYiBTZXJ2aWNlcyBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJIClRhbWFyYS1EYW56
LVN0ci4gMTMKMTAyNDMgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxh
ZWdlcgpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIg
MjU3NzY0IEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMzY1IDUzOCA1OTcK

