Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE7A3BBFCF
	for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693438; cv=none; b=ETtSpk4sSG8lD5WD8gfHb/lKPss9XctFFCziELBEnb3NJvOuzZ+xpoFbOhPoAeM5VWUwKIvdLrS/lqq5Ckp+ZzbHP7ar6PMPDdovrcdwaeYwQAVEQVL9JHxSIU8YepoMIQqdaOuFL62v5BzGoR1ivlNns2oHZd14H4ATyhosGHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693438; c=relaxed/simple;
	bh=t4Q0WQfz6y3C0uZuMQcyNH+6bWNFCt1+FN6StBNytPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oz5cCMx5C3bRAauenXlvMbZpqW1HOhB88hzsSESqnbXJdoF6PtAqfjmYowNhYhVZeX8x2VRtD08Gqg+ej3WmI4ArnqqAIgRJT/lXMwCtmajwIggSPwvmWSsboYgDDYo558IhmxlVk6Kmfen8g6gNbXL3wBFx5BMV5Vl98dZsuD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=F1F2ku+t; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="F1F2ku+t"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so59337335e9.2
        for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 03:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781693434; x=1782298234; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ofCbIxEGNbpACkwDaqN/ZJOhBt0Wqyfh2b5AswgGuBo=;
        b=F1F2ku+tQms8Dcm6rMuHQTXAucOlKcDCKNDPgDaOnGhHnxCGrGgwLd6AJdXfJzYvEq
         bljMxTkeG7B+JoZvlRxWWB6QcXvvYrXJExD9pN41DKxKYuvFpxihDa6P9j5bFX36T+BD
         YoeJDGvvBloxJPMvwU43UpOZwFy+DhToPRFSC/BxPmYBR21ZgDVj4+iUy2ZEYUVvGqmU
         BNCE/UAW7/tTtNgHJW7gxEnruMYfMFK9aknXw3wvhqAUkSU8tq4TSVMLxdgFz+i4ZA5k
         shyp6b+dfTWFDPXeuCf892hACpHuFFLC64XYV9QVaAej0887sR/p/k2c/XBXNSeU4Wrt
         75Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781693434; x=1782298234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofCbIxEGNbpACkwDaqN/ZJOhBt0Wqyfh2b5AswgGuBo=;
        b=lXzNFyoKxTQcXuEPYe6Ahf/ctWyd4kOilDxC2H8DJxJHx1eO5z/+4n+2VifPu6GQQm
         KDVwi/vjUOv/mM8KTKzRgckd96x4U2XtAe4q4DIMoJ+S0bj+Lh4ida3sdwDt3goSYTtA
         OEhJ1fJtqx/pNiJlDUQqv4ySoliyWdCJVYu62LJeXug/AKJOQKxkYl6qVxZYFqrZDT2d
         TjtF+25PKgBEgi6T9RsE8suL4mKB2QVKzMCmNOG5T8I3kzjzZhW7ms3jrbUOluOmvIR1
         Nva9wmUfF4b6hwkszTVqtotvRIh1slbAKhmpdTKNMP4TqgCdbp4kab5EksaksyBbCw+J
         GwzA==
X-Forwarded-Encrypted: i=1; AFNElJ8gF2xKqVZHVH7iJg+iKwiK28Jzz/dqKhDTrtPH2kKEnGR6tNm3DcwWOt8CaepyhJkJVBQ8@lists.linux.dev
X-Gm-Message-State: AOJu0YzvgKqk+5P7oGDmIO5xk0a3WIKnMAB6HtLrJFE8GWLYfqv5Y2Nt
	0je1k1AyIuz5t9Zh5noTMqxuWhBHkVNrdjx8yW1b/O/Eakd79zWqM7YYqD1cNyRV4O4=
X-Gm-Gg: Acq92OF/amKvLGBBrpPezEwyZX7mSOlLTn+CbCUyJOzpveuYlc5tSBcsIJXBbmhPBIV
	j8DLWiy7lhIVpObQ6o6eAqH84OmEiQIHE0Ag9YpVWgPS92E/gn7T1LSE6Kuy+HKZ8v3ciu345gu
	dBjYRgiK2mu+2SCjq/guzM1IW9JX1fCuXQrDInTvC4ewUQEF9NAqrB5gk3gmmeUTHKnKnFB4r9h
	PvDNZycTopq4WqH4lW8Bo+Gh5AQHAxXtVR1brgiDaOOMWVfrVPTzsv0vRZGDwTvuj82ZPZtO5v/
	ACr308S6m41e0yj8KI+HCObQAoqwu+ku0+VZvDqMfHiV6mDeX3xLi/xQH82VbWKgLZCS/gvGHSZ
	15crxHoeR5QgsSfL332VWZoYlP+53OopdJ6QCcqjNQSfqRLoEnrkMRRUl/8d9dDD4LhpkDacdGC
	MbzKTy/9ufSVs6UEDV8gkxW7f28tRJog==
X-Received: by 2002:a05:600c:c09a:b0:490:e196:6574 with SMTP id 5b1f17b1804b1-492333bf89bmr48975455e9.13.1781693434339;
        Wed, 17 Jun 2026 03:50:34 -0700 (PDT)
Received: from [10.0.2.3] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa510e7sm179725275e9.7.2026.06.17.03.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:50:33 -0700 (PDT)
Message-ID: <71a166bc-06c9-4a84-b61b-6b0d7c6c6585@suse.com>
Date: Wed, 17 Jun 2026 12:48:10 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] modpost: Ignore Clang LTO suffixes in symbol matching
To: Rong Xu <xur@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Siddharth Nayyar <sidnayyar@google.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Eric Dumazet <edumazet@google.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>,
 Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20260615222019.4116687-1-xur@google.com>
 <CAF1bQ=S3SLC4d6ODFfAFRMw_kLWq0wFqhCM9Uz_yEW3004b3wg@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CAF1bQ=S3SLC4d6ODFfAFRMw_kLWq0wFqhCM9Uz_yEW3004b3wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/16/26 12:43 AM, Rong Xu wrote:
> A more direct fix for the warnings in
> https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel.com/
> looks like the following. But I believe the solution provided in the
> patch is more comprehensive.
> 
> -Rong
> 
> ======
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index abbcd3fc1394..1f0a379b43c8 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -967,7 +967,7 @@ static int secref_whitelist(const char *fromsec,
> const char *fromsym,
>         /* symbols in data sections that may refer to any init/exit sections */
>         if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
>             match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)) &&
> -           match(fromsym, PATTERNS("*_ops", "*_console")))
> +           match(fromsym, PATTERNS("*_ops", "*_ops.llvm.*", "*_console")))
>                 return 0;
> 
>         /* Check for pattern 3 */
> 

This variant makes more sense to me. The initially proposed patch
modifies the match() function, which is a generic function to check
whether a string matches any of the input patterns. The modpost utility
uses it to match both symbol and section names. Adding symbol-specific
knowledge to this function seems odd.

I noticed that LLVM has recently made improvements to reduce the number
of these ThinLTO renames [1], which might be worth checking out.

[1] https://github.com/llvm/llvm-project/commit/975dba28633d2f3746a8a370741b17024b0f5f9b

-- 
Thanks,
Petr

> On Mon, Jun 15, 2026 at 3:20 PM <xur@google.com> wrote:
>>
>> From: Rong Xu <xur@google.com>
>>
>> When building the kernel with Clang ThinLTO enabled, the compiler
>> can mangle static variable names by appending suffixes such as
>> ".llvm.<hash>" to prevent naming collisions across translation units.
>>
>> This name mangling breaks the section mismatch whitelisting in modpost.
>> modpost relies on glob patterns (e.g., "*_ops" or "*_probe") to identify
>> safe references between permanent data and initialization code. Because
>> the LTO suffix modifies the end of the symbol name, legitimately
>> whitelisted structures fail the match, resulting in false positive
>> warnings.
>>
>> For example, a static pernet_operations struct triggers the following:
>>
>>   WARNING: modpost: vmlinux: section mismatch in reference: \
>>   ping_v4_net_ops.llvm.5641696707737373282 (section: .data) -> \
>>   ping_v4_proc_init_net (section: .init.text)
>>
>> Fix this by stripping ".llvm." suffixes from the symbol name in match().
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel.com/
>> Signed-off-by: Rong Xu <xur@google.com>
>> ---
>>  scripts/mod/modpost.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>> index abbcd3fc1394..1f5a64eeb048 100644
>> --- a/scripts/mod/modpost.c
>> +++ b/scripts/mod/modpost.c
>> @@ -727,6 +727,18 @@ static const char *sym_name(struct elf_info *elf, Elf_Sym *sym)
>>  static bool match(const char *string, const char *const patterns[])
>>  {
>>         const char *pattern;
>> +       char string_stripped[512];
>> +       const char *ext = strstr(string, ".llvm.");
>> +
>> +       /*
>> +        * Clang LTO can append .llvm.<hash> to a variable. Safely strip
>> +        * the suffix so glob whitelists (like *_ops) work.
>> +        */
>> +       if (ext && (ext - string) < sizeof(string_stripped)) {
>> +               strncpy(string_stripped, string, ext - string);
>> +               string_stripped[ext - string] = '\0';
>> +               string = string_stripped;
>> +       }
>>
>>         while ((pattern = *patterns++)) {
>>                 if (!fnmatch(pattern, string, 0))
>>
>> base-commit: 2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
>> --
>> 2.54.0.1136.gdb2ca164c4-goog
>>
