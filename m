Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C62628A1D5
	for <llvm@lists.linux.dev>; Tue, 30 Dec 2025 09:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767086060; cv=none; b=GQvuh+cWqZifEUbK2FO0j2d8g258Jp+FF7rhbfWXYJRAbsCq+HmSRlhqxmmnvXIsfhwc6qQFeLu96iCtYbdr/luHsK0gYxEw2/vfH3CM4oQnAMHn3GYeyK/bPo8TCBtY+uoic0StP5xKgA9obpIft3xKnc9NxjgkXkTGSjq0C10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767086060; c=relaxed/simple;
	bh=kMYS4nDZW+xqFk8WFjUw9cG0U0R3IAGkPMZX0g8pS98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJD9rV0qImqT2NqpXj7XgFMa9j8O56WlTz455sLNMt7+mil4zbR5s/1j+EZ3aVnLNoNdVinAOSTEJqIMmXyJ5jonyUkwIXgRJBiaXm7Pfhn73zuHGM+tJE0YlHzVDSXP0rxdOzaEpPl1HdGUL+8a2tTqBtfNxuURFyNfmviRgno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=fail smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BR1noxDJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BR1noxDJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47774d3536dso77912185e9.0
        for <llvm@lists.linux.dev>; Tue, 30 Dec 2025 01:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767086056; x=1767690856; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6HQy+93eKiQBXRGPg3IyKK5TzImasqN2aR2WZLtqxk=;
        b=BR1noxDJLIixXDqhGjPi9BrNwUkIGLPsPHlwaNAQ7k0+B6MkoD6gpJYpxAENDA2GP+
         v3uQ1Uj0mDY9lxq4wQcazr+RyRvYiF0katHtTFvjZ27gKZAnF/zZwHsQBRV/uDM5wdhv
         INNEgDtgBXpPALk6fUejhpaoU9TuZbW8AtIHpI8l20bZGQYzBgYmcqPROrgGKN+5sz5G
         tMAz3HktgvhME79zQuJLc3oFqVWX4fbC/J0HIBq4zAbqPNqN4Bb70jc0e+k/aAQiw6dg
         8t1UjJjO/QtXkSUxE8W/ubKDnGRhCi4ujHn/m5ZxuSg9TVC4xoMSWmVseyyNGh6nQWRt
         Nv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767086056; x=1767690856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6HQy+93eKiQBXRGPg3IyKK5TzImasqN2aR2WZLtqxk=;
        b=Tjf2p7IWT/Zg1GA71NPx9gB06UbFKUmtPJYAHU5x+DbX3eycAv+RTCR3lZSYDgiiL/
         eKIdWuRIFnxs+FkFPbUGZG+6+3jH82yn148msD4/66yhILhj03kxN+68NCIXHKXvq4Mu
         781HxMaIqdld2s1KpwcZcSWshFIlRIn3sZtP6Ry1WxO0zxxHSeaf9SO9bQ3lU177zcB2
         +AYJ7NINQdwyPfpEGfodsDMTv6S0KCcIWIk9xyBm9XZ2RXXhjFdE9FxkH1MNt+BVAVF+
         usDy0Vov/gyGeo9tB8oWU0/0/6jcb5LwgWa+oq0zbz+0KFgid6Kv4ysVIR7QOsFjKTDe
         KnCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtMYiJOBShwc3T1ixQ3aHyq6K+4/GI0h8FI3Zby9Vn3xcHv8g3cEmQbCA+/J7hkcLqbOmq@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm8IPKCcUhgZmL4SHowYiegnT88bF8vL/q1t7xsX92VAtUCJPi
	RsCmmsPq2PhP7IJhznpCJtAVzWi4Sjg1N6NwU8eX6BCuqIpHmbWCopbI0SBHrltx7Fw=
X-Gm-Gg: AY/fxX4dH0qnI0nDwIpK2q9jUX9JRdvqxjZYk1JYNJ+lgTRio/TdL3JxcH8phluFoa/
	eczXDuC+o++BlJHkeoMXVCY6AZcJzK0X/KzGLPT56YTzr4TjQVLOD0T+WxT+H065Zn3E5kAaD9I
	VDENk2kc8Y7G5upUvftAC+Gz2qXRtGEwUu8oQ02StMkXXhi6iF1pQ6J3esGkJu434seREEe7zf4
	+qEotnEn+zgR9zBIXpVIEpR86iMMid0do6J4FwpayhBVZLhU6nVYmJ/PJ5XMnc3YtvI2hIJtnT+
	Zdwf1wvbwCWoOlUasTgYkeXJ2zGwPTYb1qYqZMhm5ApD2omFJdZtIU5zAAO+2EydHMYBWIl4L7g
	q+CtQyo7rauEn+oMRS9HiBmzSm6aK5cZ4n2a4eZLI1Mm5W+iBAFUjUKZdmRO1IxYIrZ0zaJL+f/
	8j0nks7PIIAl3Znnu16ngv96Au69bG6A==
X-Google-Smtp-Source: AGHT+IFKv3lNIvVVFE/AcEy5+lpmg1H1P5fZOOF4vDE/CodIsqYQs0HP6/eTBXDVP5Nqswfi6ttRjA==
X-Received: by 2002:a05:600c:8b82:b0:47b:deb9:163d with SMTP id 5b1f17b1804b1-47d18b99b99mr353825415e9.7.1767086056038;
        Tue, 30 Dec 2025 01:14:16 -0800 (PST)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a5486dsm254520345e9.9.2025.12.30.01.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 01:14:15 -0800 (PST)
Message-ID: <0d82084c-e633-40ff-b9fe-ce1532f28fdc@suse.com>
Date: Tue, 30 Dec 2025 10:14:13 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] module: Fix kernel panic when a symbol st_shndx is
 out of bounds
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20251224005752.201911-1-ihor.solodrai@linux.dev>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20251224005752.201911-1-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/24/25 1:57 AM, Ihor Solodrai wrote:
> [...]
> ---
>  kernel/module/main.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 710ee30b3bea..5bf456fad63e 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1568,6 +1568,13 @@ static int simplify_symbols(struct module *mod, const struct load_info *info)
>  			break;
>  
>  		default:
> +			if (sym[i].st_shndx >= info->hdr->e_shnum) {
> +				pr_err("%s: Symbol %s has an invalid section index %u (max %u)\n",
> +				       mod->name, name, sym[i].st_shndx, info->hdr->e_shnum - 1);
> +				ret = -ENOEXEC;
> +				break;
> +			}
> +
>  			/* Divert to percpu allocation if a percpu var. */
>  			if (sym[i].st_shndx == info->index.pcpu)
>  				secbase = (unsigned long)mod_percpu(mod);

The module loader should always at least get through the signature and
blacklist checks without crashing due to a corrupted ELF file. After
that point, the module content is to be trusted, but we try to error out
for most issues that would cause problems later on.

In this specific case, I think it is useful to add this check because
the code potentially crashes on a valid module that uses SHN_XINDEX. The
loader already rejects sh_link and sh_info values that are above e_shnum
in several places, so the patch is consistent with that behavior.

I suggest adding a proper commit description and sending a non-RFC
version.

-- 
Thanks,
Petr
