Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.253
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458497;
	b=KqjDMXEctyrr1RVb3O47aDNWnKHq2WmMrF1bucvmc/i2qaIF154cjp4kA9VDHtZZ9F9S
	 3aXNpfthO+iVulOLef8uPm7noSM7ihsLGPJE2oICkd4S/UimztGa7WZIXxmxJyjpiycNy
	 ozDyzAc4z84EuVmZAf70h+A6P4Vpkav3Wc7O2TINPsn8afhJ4CNb3p0UvfNVe4RKvOKOi
	 +skcG9T5veTN26vVLAazfXV/2xsS6wQpv9WBNG4oSdzmd69m6Q5igDrFTQ8I5Oym0mFxl
	 nyafj3Pogv6xVU4RgDdTnFFhR2DqQUBcxVtGOb7Y+y5zKSh3GYt2TJYzeOsaOv5FSZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458497;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Date:Message-Id:In-Reply-To:
	 References;
	bh=ePtAq88JQv2mQTCltV6prJnPqbIrXTNiEgvUQLAl4To=;
	b=P3/DXcLPOsWCY1oCFKQEeyAcXF2KdAkAdZLjfOd8zyXrqvoCGiGQkR96cOwOp3qsgSho
	 fe1hWBKvBNYg1XzshpO4vg2TWrb4T1ZWwPMeuZfkOeQv8kWTzAqi6weudvudEGpnQEzvx
	 aaCtnkm9hU58E2N/0xfL3+94TLPWyNeg3BmAZ6IqgBe4MhuiS/xEJBjSvrTVeo/C7GVn5
	 J6oPxvmCtJCx0cJ5RdEAlBoFz0l7H9g/2hFKheks8dJjFBEdrJv6Qj1wgG6AS2GCHRfYr
	 KsXKFG+LPdfoy5aJ4ScUN+JNa80YTjT3HZH7CTgGO0RCO6xyHrwtSmkh13q9tSyi95w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cressey.dev;
	spf=pass smtp.mailfrom=cressey.dev;
	dkim=pass header.d=cressey.dev header.i=@cressey.dev header.a=rsa-sha256 header.s=key1 header.b=terJ6FOM;
	arc=none smtp.remote-ip=95.215.58.253
Received: from mta1.migadu.com (out-253.mta1.migadu.com [95.215.58.253])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B6C606A31A
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 18:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B6C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cressey.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cressey.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cressey.dev header.i=@cressey.dev header.a=rsa-sha256 header.s=key1 header.b=terJ6FOM
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ePtAq88JQv2mQTCltV6prJnPqbIrXTNiEgvUQLAl4To=;
 c=simple/simple; d=cressey.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795458494; v=1; x=1796063294;
 b=terJ6FOMLbjLx3VoE3P2Fv0DRIKfB9L9FesGDQLqeEo0sybE3t2VY+wRe7CPJg1UqWyJv5Kf
 WD3nJ/U3eBH+UfZo+GtKUZTpKWdGlUvbyuS9sN13f4WLSVXyLxrgYIoL0EpNvQUWIvBlXbYBCcS
 sB24vX+NOTIlplCZrJBaeqX8C0zSh8+5Y/eAZs9ij6z+eS32B9kiVxH9DZFiBPtpI42587xk9ZN
 NkOqNzwGVel6MTPRbQL2i7eF4Pie+nIQloeQrVBR61hIe6+Zp6hYP1RIvRQ9XdQR98kEgNce6ek
 SG5pGYZI1sp3KuOQeHCh0H4ZSApHK9YE8DWd4uo0yp9Qw==
X-Envelope-To: llvm@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 1b45b762173106e7;
	Mon, 23 Nov 2026 18:28:14 +0000
X-Mizu-Trace-ID: 1b45b762173106e7
X-Migadu-Flow: FLOW_OUT
From: Ben Cressey <ben@cressey.dev>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, Josh Poimboeuf <jpoimboe@kernel.org>, kexec@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] x86/kexec: Type relocate_kernel() to drop __nocfi
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Date: Mon, 23 Nov 2026 10:27:57 -0800
Message-Id: <20261123-re-947c87d493b9@cressey.dev>
In-Reply-To: <20261112080050.GZ2668804@noisy.programming.kicks-ass.net>
References: <20261111-x86-kexec-kcfi-v1-1-b4d41ea14deb@cressey.dev>
 <20261112080050.GZ2668804@noisy.programming.kicks-ass.net>

On 2026-11-12, Peter Zijlstra wrote:
> On Wed, Nov 11, 2026 at 03:26:59PM -0800, Ben Cressey wrote:
>> The check guards only the pointer, and not reliably under plain FineIBT,
>> which checks in the callee with IBT off. A failed check panics or hangs
>> with no CFI report, since load_segments() has reset GS.
>
> I don't understand this; what?

Sorry, that was hard to follow. The patch gives relocate_kernel() a kCFI
type. The call to it is then checked, and machine_kexec() no longer
needs __nocfi. It does not fix a known bug.

That paragraph was about the limits of the new check. Plain FineIBT
relies on IBT, which is off at the call, so it can miss a pointer to
code with no preamble. A failed check may panic or hang without a CFI
report because load_segments() has reset GS.

If you'd rather keep __nocfi, I'm happy to drop the patch. Otherwise
I'll send a v2 with simpler text.
