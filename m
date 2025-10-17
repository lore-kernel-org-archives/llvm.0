Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2CF221726
	for <llvm@lists.linux.dev>; Fri, 17 Oct 2025 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760721690; cv=none; b=TmOVxB7ni+cXPZFSc+hImK3oa1Relzltxzpdl/Ve36GKhKO+FwK3NTyGUqx62IT2Us5ks//rm+dK3/ldrJCoCTWgmE44uVTo6+V+9+z8S0PpD4ZPg4YpZQt1+TLXq7MndkBvjQveFOZsQ/3mKHUgzVRpxurEYcNNsu5h6JPKBR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760721690; c=relaxed/simple;
	bh=ZDlKJimU5yJhuf6h4fCvKg0ckr1WuWl19ZMREUl6Jf8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fgeV6uegAr3UHB6Wab13u8XI2fmmW3rB/X/kt9u9yut9GM8OnVs9+G098UbZqEl9PnrWtrdKCi/6G98hdiVhP015T6kK78myzNZM4N8a8+gPrb+NbIo3MS5mkngmmHMOZDp7/G0D4lSkVZ4GtSwLNQcPgvpsqz+h7Ja6K9dS7us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqiPrcpU; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqiPrcpU"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so2125749b3a.1
        for <llvm@lists.linux.dev>; Fri, 17 Oct 2025 10:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760721688; x=1761326488; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZDlKJimU5yJhuf6h4fCvKg0ckr1WuWl19ZMREUl6Jf8=;
        b=QqiPrcpUHPhbjGiFlaRuG7DBhEukXaH2uKMQ98MNZRa/qzuRrmb+nFYysvWrcr5DKc
         ITbrIbIu1uBk92HDLZZnoUZRtB7wFQYYsFHphJzRvi8ZtT+FH5LVN0Oiwlhx3zpohVIh
         QqmlWy4yS4yFJ7GkBsWlWz8x7l/K0ooNjfi4vbfpokmw8FaJcLXOF4fJFK+Fe1USUwH8
         O/R6mxa2urGQmOAaCp1mQxaH4YiqHpFiKHisgOuAmye7fv9BB6aqfCiARmFTmkqv07Ge
         pESREX5a4/CgUbrSoRwGCSye3Q26NGnz60ZkEBxKFfqRJd1BIxGu0vc4R5CKsQMdz02g
         fCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760721688; x=1761326488;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDlKJimU5yJhuf6h4fCvKg0ckr1WuWl19ZMREUl6Jf8=;
        b=o6Z0Ca580EYqnvTpwWN2tVpCQGL0bL5biSthWJfyEalhIokJoeRAmcuUtpY6Kq/kPd
         s1P7TRhopOx6azwZ0yFE+4d3zk1yPbucHaO4d9ltawszVwbbweX9+xrepa0sFYITpO84
         JLgPJZhT+XpXR2blGORNI9hy8geSMXgL9B48ycKS2Mz1cd9vmpNyWKGDaEfrLgdRn4Tf
         N4RNql0mYsQevaAZJzwbpyiRNbOLvVb4XhGfV54k8Egnb5Dt7vcEGKNYdOFsVbONOcTr
         gFYC5NYXHuOe0G6lYR8qvePQX9DaPr8Uya/myrDVySFLJ3q2f+YNGTA7vwCv7kNKlmVO
         pKNg==
X-Forwarded-Encrypted: i=1; AJvYcCUMjOU3JhoxXhpmEnG5Vo04s8N78FfEOObvdhifMpbhkePQJeu+HvvAfQpQplK+9hpLH8NO@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo0HSfCr9DE9mtB8bGxBbANLXOSh/kcwNDR9jlB1EnwnmxsWN2
	mE/qngzYJ8PfudSGo7nhE89HhhHjHa0fADNnXMNtfDBks43b2NNxT0W5
X-Gm-Gg: ASbGncs7bVDUBJry/jnXw5Ty+hH2KzImMqyD05nvk1+nYgt288lXQD8BeVt5zVpvX12
	DQ1tWwzDsENYlIiorsdVtQAZ9voDys4wLt3ULCVRc54ZKB53wzv6n7kI3dvdtMqlWDSCgKYdgCB
	VgnPvTm7hc3AsfwlAQQ0INMqcYZ9H0UzJHY43b5hWHnDzubSagXTZ8aPXXUxVJEmUTnHg7K5AGg
	mna5Qg4j95VTq1dgL80eEUZ2j7Q7SzJ0aKgIK+4sN+nnmZZqve8m2tH+O8e5+p5quECJ5xzq66j
	NvndOke1kUOZbPyMofxPBZQ1WwOW3b6f6TEZGWloQ4LeSm0AHIS05aaz3XS5tACHLLbxtZ7Bsy/
	UDBnYoweGSrES2m9ePpniSgZka7PGrwbD38eCuXonoTjzRqbL6sez5EKKOTy+i5ujhoza108iFa
	eYtzaVFS+2qhOziKGN/p+zpkpB
X-Google-Smtp-Source: AGHT+IFQYLtYz7qONoqCEU96HpuXSGRA2s1vrwiIlcoSHnAwgXFDW4IUXMHSrbKxOMdYny4f7jwfBQ==
X-Received: by 2002:a05:6a21:328a:b0:334:97a1:36af with SMTP id adf61e73a8af0-334a8523ebbmr6345679637.13.1760721688421;
        Fri, 17 Oct 2025 10:21:28 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:49ef:d9f5:3ec:b542? ([2620:10d:c090:500::7:77fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5608eb4bsm166765a91.21.2025.10.17.10.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 10:21:28 -0700 (PDT)
Message-ID: <46370bb8fcb2f01bce5402a6f7937426731fa450.camel@gmail.com>
Subject: Re: [PATCH v2] scripts/clang-tools: Handle included .c files in
 gen_compile_commands
From: Eduard Zingerman <eddyz87@gmail.com>
To: Pat Somaru <patso@likewhatevs.io>
Cc: justinstitt@google.com, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, 	morbo@google.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, 	nsc@kernel.org
Date: Fri, 17 Oct 2025 10:21:26 -0700
In-Reply-To: <20251008004615.2690081-1-patso@likewhatevs.io>
References: <20251008003739.2659141-1-patso@likewhatevs.io>
	 <20251008004615.2690081-1-patso@likewhatevs.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-10-07 at 20:45 -0400, Pat Somaru wrote:
> The gen_compile_commands.py script currently only creates entries for the
> primary source files found in .cmd files, but some kernel source files
> text-include others (i.e. kernel/sched/build_policy.c).
>=20
> This prevents tools like clangd from working properly on text-includedd c
> files, such as kernel/sched/ext.c because the generated compile_commands.=
json
> does not have entries for them.
>=20
> Extend process_line() to detect when a source file includes .c files, and
> generate additional compile_commands.json entries for them. For included =
c
> files, use the same compile flags as their parent and add their parents h=
eaders.
>=20
> This enables lsp tools like clangd to work properly on files like
> kernel/sched/ext.c
>=20
> Signed-off-by: Pat Somaru <patso@likewhatevs.io>
> Tested-by: Justin Stitt <justinstitt@google.com>
> ---

I tested navigation to work in emacs+clangd combination with this
patch for the following files:
- kernel/sched/pelt.c
- kernel/sched/cputime.c
- kernel/sched/deadline.c

All included from the kernel/sched/build_policy.c.
Navigation works for entities declared in the same file, entities
declared in headers included from build_policy.c, entities declared in
headers included from {pelt,cputime,deadline}.c.

Note that sched/ code [ab]uses the pattern with .c file includes a
lot. W/o this patch clangd is completely oblivious to the content of
the above files. Jump to definition is almost useless, who-calls
queries ignore functions declared in these files etc.

Tested-by: Eduard Zingerman <eddyz87@gmail.com>

[...]
