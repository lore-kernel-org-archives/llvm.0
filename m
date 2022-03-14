Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413767469
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 23:53:28 +0000 (UTC)
Received: from [IPV6:2601:646:8600:40c0:7285:c2ff:fefb:fd4] ([IPv6:2601:646:8600:40c0:7285:c2ff:fefb:fd4])
	(authenticated bits=0)
	by mail.zytor.com (8.17.1/8.15.2) with ESMTPSA id 22EN9n2q891914
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 14 Mar 2022 16:09:50 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 22EN9n2q891914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2022030301; t=1647299390;
	bh=yXYBP3SJCOpI0B/SJTjM6RkYHfQUJdmFKPcrRE0IY/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DrHy7s86fzmIPg8XhYfzqeCwYBzJQPmhjNe4B1TnB9/QTlhoULdBdpRlLcwkRUujg
	 X0/ai06rOXA4XVjjnDroL6+5/zNWZDf+fvxZ7ND4fG6WjkyX8SnZcZF82oQZRFN3x3
	 wL5VTvOlHixhK0mpSjtwNjhPo1Sxonx20h83cATTSj8h9LorPzkjRQy5PmpkG2mkNP
	 6oUpdnQli1XNDELG0HdFeU0w9Rikpmrkq1it+Xg5/xcV0+HKPPMLpAMns9CXofETR5
	 NiSvVoGxRiYKUPq/Sk2PEL5UctDZIHY/cIt9ochYfo/BZ51GaI39jlL3wxIrRFt/fK
	 oN79FSUicshKg==
Message-ID: <dccb0cf2-edc1-fb98-d4ca-4f76687b7e6c@zytor.com>
Date: Mon, 14 Mar 2022 16:09:44 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86: use builtins to read eflags
Content-Language: en-US
To: Bill Wendling <morbo@google.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev,
        LKML <linux-kernel@vger.kernel.org>
References: <20211215211847.206208-1-morbo@google.com> <87mtl1l63m.ffs@tglx>
 <CAGG=3QV2sw1w+j2NDqPVAbobGj04QXfOF0VcSCebRbs6y-L5WA@mail.gmail.com>
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <CAGG=3QV2sw1w+j2NDqPVAbobGj04QXfOF0VcSCebRbs6y-L5WA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/21 11:55, Bill Wendling wrote:
> On Wed, Dec 15, 2021 at 4:57 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> Bill,
>>
>> On Wed, Dec 15 2021 at 13:18, Bill Wendling wrote:
>>
>> please always CC the relevant mailing lists, i.e. this lacks a cc:
>> linux-kernel@vger.kernel.org
>>
> I thought that was automatically added. But as Peter pointed out in
> another email thread, no one has time to read the LKML, so it seems a
> bit pointless? Nonetheless it's added now.
> 

Consider linux-kernel a distributed archive. Noone reads it in real 
time, but it is really great to be able to search for someone specific 
in one place.

	-hpa

