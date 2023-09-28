Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046F18BFF
	for <llvm@lists.linux.dev>; Thu, 28 Sep 2023 14:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695910195; x=1727446195;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rWPUuNNdKXgrAPoDqjutOvUZaBIRMfIRRc8S+g1NzQo=;
  b=VW7yIA0EkO9nup8C8MdxmdTcFGWmbEmbB15nF9IJSCnkqAgFshlK0YLY
   YCA4kY0+TdhcW8lPYEmbflaCZXir4EH971LeVTBOcT1tKU8wR2ar+JXTT
   lPr+yPjK29KUZaYPG5uMvJwvG9eGTfnEosqOYGUUqXI2rwy5us5HtArBn
   AHGcG9VdIMY118uyZeKsjsxkHlFiKxrqOlIaVcR5QrRwwwIDSjJ4tp+/j
   7ygQJDj8xML3WzBE3nlxcqvWaZ+AMGJAVreaJEyCeVBZTB5u1DiHoixoW
   g0c0ih2jclec9SutIfpm1pSv4do/aTmxF/rX0F0orn81igEyR4TEzJNmb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468356755"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="468356755"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 07:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="815243277"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="815243277"
Received: from jveerasa-mobl.amr.corp.intel.com (HELO [10.255.231.134]) ([10.255.231.134])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 07:09:52 -0700
Message-ID: <b22a3863-cf11-14b7-23f3-4b8971f44580@intel.com>
Date: Thu, 28 Sep 2023 07:09:52 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/5] KVM: x86: Constrain guest-supported xfeatures only at
 KVM_GET_XSAVE{2}
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev,
 Tyler Stachecki <stachecki.tyler@gmail.com>,
 Leonardo Bras <leobras@redhat.com>
References: <20230928001956.924301-1-seanjc@google.com>
 <20230928001956.924301-3-seanjc@google.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230928001956.924301-3-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/27/23 17:19, Sean Christopherson wrote:
> Mask off xfeatures that aren't exposed to the guest only when saving guest
> state via KVM_GET_XSAVE{2} instead of modifying user_xfeatures directly.
> Preserving the maximal set of xfeatures in user_xfeatures restores KVM's
> ABI for KVM_SET_XSAVE, which prior to commit ad856280ddea ("x86/kvm/fpu:
> Limit guest user_xfeatures to supported bits of XCR0") allowed userspace
> to load xfeatures that are supported by the host, irrespective of what
> xfeatures are exposed to the guest.
> 
> There is no known use case where userspace *intentionally* loads xfeatures
> that aren't exposed to the guest, but the bug fixed by commit ad856280ddea
> was specifically that KVM_GET_SAVE{2} would save xfeatures that weren't
> exposed to the guest, e.g. would lead to userspace unintentionally loading
> guest-unsupported xfeatures when live migrating a VM.
> 
> Restricting KVM_SET_XSAVE to guest-supported xfeatures is especially
> problematic for QEMU-based setups, as QEMU has a bug where instead of
> terminating the VM if KVM_SET_XSAVE fails, QEMU instead simply stops
> loading guest state, i.e. resumes the guest after live migration with
> incomplete guest state, and ultimately results in guest data corruption.
> 
> Note, letting userspace restore all host-supported xfeatures does not fix
> setups where a VM is migrated from a host *without* commit ad856280ddea,
> to a target with a subset of host-supported xfeatures.  However there is
> no way to safely address that scenario, e.g. KVM could silently drop the
> unsupported features, but that would be a clear violation of KVM's ABI and
> so would require userspace to opt-in, at which point userspace could
> simply be updated to sanitize the to-be-loaded XSAVE state.
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

It's surprising (and nice) that this takes eliminates the !guest check
in fpstate_realloc().
