Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB123D61
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 12:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663157047; x=1694693047;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=udCJhyc3zUwPrqKS2ZA+808BCqR4ZsWMs3OJuoP2Ax4=;
  b=dLQ9goyzrmTz/bBCUFOKGjbp75g+7R9mEfUnQ2g5od7RNAtdYiQRIIL7
   4uhEi5ShrjcccmMQtwrD9OL+r6X+GdK4Bjv0PN38fPcfb4YndM84F0Lxh
   xmii7tbNYUXcGRGFety2WPdCvJY/HmOO9SKtiX0z2Szo9mL6g6KdNNwqL
   BRqq/duq/QevtlSv5NCN8YUEXZ6TZfgFArm1v+eMLNaSVmX4xKthexLos
   kgnXnietwLQYUGVgbkNxqhEQ9j8C+UEN+hArsBpnO0Le+GIVPrsBNC/6V
   k/5A/FhNZwcT9eC5EdnthUqqwzY5qpexlygs9Gxfhp2mTdtx7G+OWEaih
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="278138504"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="278138504"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 05:04:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="567984401"
Received: from rwathan-mobl1.ger.corp.intel.com (HELO [10.213.220.95]) ([10.213.220.95])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 05:04:01 -0700
Message-ID: <2625dbfa-434c-7d55-6469-9d9e89397e8f@intel.com>
Date: Wed, 14 Sep 2022 05:03:59 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 RESEND] x86/asm: Force native_apic_mem_read to use mov
Content-Language: en-US
To: Peter Gonda <pgonda@google.com>, Adam Dunlap <acdunlap@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Andi Kleen <ak@linux.intel.com>, Ben Dooks <ben-linux@fluff.org>,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Jacob Xu <jacobhxu@google.com>, Alper Gun <alpergun@google.com>,
 Marc Orr <marcorr@google.com>
References: <20220812183501.3555820-1-acdunlap@google.com>
 <20220908170456.3177635-1-acdunlap@google.com>
 <CAMkAt6qUs526FCq26Ht48c2KVZWe=QcNds6_LE6JJbs-7Hzk+g@mail.gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <CAMkAt6qUs526FCq26Ht48c2KVZWe=QcNds6_LE6JJbs-7Hzk+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/22 04:13, Peter Gonda wrote:
> On Thu, Sep 8, 2022 at 6:05 PM Adam Dunlap <acdunlap@google.com> wrote:
>> Previously, when compiled with clang, native_apic_mem_read gets inlined
>> into __xapic_wait_icr_idle and optimized to a testl instruction. When
>> run in a VM with SEV-ES enabled, it attempts to emulate this
>> instruction, but the emulator does not support it. Instead, use inline
>> assembly to force native_apic_mem_read to use the mov instruction which
>> is supported by the emulator.
> This seems to be an issue with the SEV-ES in guest #VC handler's
> "emulator" right?

No.

It's not just an SEV-ES thing.  It's a problem for TDX and _probably_ a
problem for normal virtualization where it's a host-side issue.  Kirill
wrote a lot of great background information in here:

> https://lore.kernel.org/all/164946765464.4207.3715751176055921036.tip-bot2@tip-bot2/

So, the question is not "should we extend the MMIO instruction decoders
to handle one more instruction?".  It is "should we extend the MMIO
decoders to handle *ALL* memory read instructions?"

That's an even more emphatic "NO".

readl() seems to be the right thing to do.  Also, Dear TDX, SEV and virt
folks: please look for more of these.  They're going to bite you sooner
or later.  You should have caught this one before now.
