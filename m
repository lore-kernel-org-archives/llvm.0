Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE17F200D4
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 21:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696282872; x=1727818872;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=Aqw5m6gatMKMCy8cj+FlMMsq3bPOpbrtqavs7kKDGYw=;
  b=ZXxZA43KYIiWYS2Pov/q2nypRHqatua8W0dDr1K+VIf3FlEZflfLXnE+
   hF3bR1UdKVNLsBi9HpnVMkVZLgSRRvjjEMNxu0LuB0Xn9u1Z1aEMNbCwv
   YVNnhWIfYlE7HdMUPtIsC+fPFV1sIeA10sJSHZ4ycRgte+ne74GkdOVUw
   ZeF+H+ydhPKgA9nSGM8Vp+EWJK4WcCmIljhV+x/zdv9sAGBXkvmVoLOgN
   Nf/f7xLp+IdygrmkACdw6RMsyCsy7n4FspFUEp+vihUP2a/iZFAwq8/EE
   xog3FtcQS4zddSEtJIzXLaB7DzyeKKid8VXcZZ2FC5TI4Wb/5c6xZNO9v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="381626094"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="381626094"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 14:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997763284"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="997763284"
Received: from dbhattac-mobl.amr.corp.intel.com (HELO [10.212.142.100]) ([10.212.142.100])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 14:41:10 -0700
Content-Type: multipart/mixed; boundary="------------DCmy7uiG3ousBC4lvqGHpGr2"
Message-ID: <8c99f8d2-247d-ccee-3a0b-e95e547f8b9b@intel.com>
Date: Mon, 2 Oct 2023 14:41:09 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] x86/sev-es: Only set x86_virt_bits to correct
 value
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Adam Dunlap <acdunlap@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Sean Christopherson <seanjc@google.com>, Kim Phillips
 <kim.phillips@amd.com>, Juergen Gross <jgross@suse.com>,
 Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <jroedel@suse.de>,
 Tom Lendacky <thomas.lendacky@amd.com>, David Hildenbrand
 <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Nikunj A Dadhania <nikunj@amd.com>, Dionna Glaze <dionnaglaze@google.com>,
 Peter Gonda <pgonda@google.com>, David Rientjes <rientjes@google.com>,
 Khalid ElMously <khalid.elmously@canonical.com>,
 Jacob Xu <jacobhxu@google.com>, llvm@lists.linux.dev
References: <20230912002703.3924521-1-acdunlap@google.com>
 <20230912002703.3924521-3-acdunlap@google.com>
 <20231002200426.GA4127272@dev-arch.thelio-3990X>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20231002200426.GA4127272@dev-arch.thelio-3990X>

This is a multi-part message in MIME format.
--------------DCmy7uiG3ousBC4lvqGHpGr2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/23 13:04, Nathan Chancellor wrote:
> On Mon, Sep 11, 2023 at 05:27:03PM -0700, Adam Dunlap wrote:
>> Instead of setting x86_virt_bits to a possibly-correct value and then
>> correcting it later, do all the necessary checks before setting it.
>>
>> At this point, the #VC handler references boot_cpu_data.x86_virt_bits,
>> and in the previous version, it would be triggered by the cpuids between
>> the point at which it is set to 48 and when it is set to the correct
>> value.
>>
>> Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
>> Signed-off-by: Adam Dunlap <acdunlap@google.com>
> Our continuous integration started seeing panics when booting ARCH=i386
> without KVM after this change landed in -tip as commit fbf6449f84bf
> ("x86/sev-es: Set x86_virt_bits to the correct value straight away,
> instead of a two-phase approach"):

I can't reproduce this, but I'm running a gcc-built kernel and I haven't
tried very hard to replicate your qemu setup.

I did notice, though, that the patch in question forgot to move one
assignment.  Could you see if the attached patch fixes things for you?
--------------DCmy7uiG3ousBC4lvqGHpGr2
Content-Type: text/x-patch; charset=UTF-8; name="cache-bits-debug.patch"
Content-Disposition: attachment; filename="cache-bits-debug.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtcHVOIGFyY2gveDg2L2tlcm5lbC9jcHUvY29tbW9uLmN+Y2FjaGUtYml0cy1kZWJ1
ZyBhcmNoL3g4Ni9rZXJuZWwvY3B1L2NvbW1vbi5jCi0tLSBhL2FyY2gveDg2L2tlcm5lbC9j
cHUvY29tbW9uLmN+Y2FjaGUtYml0cy1kZWJ1ZwkyMDIzLTEwLTAyIDE0OjIwOjQ4LjI3MzQx
NTQyMyAtMDcwMAorKysgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L2NvbW1vbi5jCTIwMjMtMTAt
MDIgMTQ6MjQ6NTIuNzEwMTI5MDUxIC0wNzAwCkBAIC0xMTQyLDYgKzExNDIsNyBAQCB2b2lk
IGdldF9jcHVfYWRkcmVzc19zaXplcyhzdHJ1Y3QgY3B1aW5mCiAJCX0KIAl9CiAJYy0+eDg2
X2NhY2hlX2JpdHMgPSBjLT54ODZfcGh5c19iaXRzOworCWMtPng4Nl9jYWNoZV9hbGlnbm1l
bnQgPSBjLT54ODZfY2xmbHVzaF9zaXplOwogfQogCiBzdGF0aWMgdm9pZCBpZGVudGlmeV9j
cHVfd2l0aG91dF9jcHVpZChzdHJ1Y3QgY3B1aW5mb194ODYgKmMpCkBAIC0xNTk1LDggKzE1
OTYsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY3B1X3BhcnNlX2Vhcmx5X3BhcmFtCiAgKi8K
IHN0YXRpYyB2b2lkIF9faW5pdCBlYXJseV9pZGVudGlmeV9jcHUoc3RydWN0IGNwdWluZm9f
eDg2ICpjKQogewotCWMtPng4Nl9jYWNoZV9hbGlnbm1lbnQgPSBjLT54ODZfY2xmbHVzaF9z
aXplOwotCiAJbWVtc2V0KCZjLT54ODZfY2FwYWJpbGl0eSwgMCwgc2l6ZW9mKGMtPng4Nl9j
YXBhYmlsaXR5KSk7CiAJYy0+ZXh0ZW5kZWRfY3B1aWRfbGV2ZWwgPSAwOwogCl8K

--------------DCmy7uiG3ousBC4lvqGHpGr2--
