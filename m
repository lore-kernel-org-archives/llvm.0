Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB123C14
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665502267; x=1697038267;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cYpCJz7OhFUxc5+oKcS7CVxf4L5yvVH/ZQYUtwQ8NTo=;
  b=KP1Gr8+Ol5l0QqfxXgZU26o5pFwsmMYFT07x7i4nNlF0JHkHCuoglL4F
   3XrgyOgdHzCo84HDngE0KeicuNg/2kg9RzVxWucZYHebaaziCWzfEjjaE
   Ws2836J/dG2x+nd+CXNYhfFokyxZd8Tdn/Nroi6CXIOOGpyfztbCRlxIB
   RazDkNhjVhfXthjqeOAxtljQCzNGe3mmFMsqOVJSqbNGEoHD2hS/PxcIp
   4OMlG+oZAwJ+Gh7I8cSWxJ0hNRUD3qYGsgn6wv+yzNBi8Qf7AUVywlE1W
   Q0qdGK35VjNrKBwgTt0ANM6AgzHIRDLJo0DqH0rQfwnG972kYRSvwSvIh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="287798396"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="287798396"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 08:31:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="659569819"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="659569819"
Received: from makozuch-mobl2.amr.corp.intel.com (HELO [10.209.39.67]) ([10.209.39.67])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 08:31:05 -0700
Message-ID: <3b5bfa95-ff64-0e8b-44a3-8b67b767ffd6@intel.com>
Date: Tue, 11 Oct 2022 08:31:04 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] Remove Intel compiler support
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-ia64@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Len Brown <lenb@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Robert Moore <robert.moore@intel.com>, Tom Rix <trix@redhat.com>,
 devel@acpica.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20221011031843.960217-1-masahiroy@kernel.org>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20221011031843.960217-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/22 20:18, Masahiro Yamada wrote:
> I am sending this to Linus and the x86 maintainers with RFC.
> If somebody is still using ICC, please speak up!

Yeah, the bit rot is not a good sign.  I honestly can't remember seeing
anyone actually use icc during my entire tenure at Intel.  I'll ask
around to see if there's any plausible reason to fix this up and keep
it.  But, I'm not holding my breath.

