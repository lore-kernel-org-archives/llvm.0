Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46585233140
	for <llvm@lists.linux.dev>; Sun, 28 Sep 2025 23:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759103091; cv=none; b=hUmZlYE1pN1dFder4ev7YeAGIk+ZJHKYW2gtNtgRaFiuu4xzcDNWRHEirn3D9QcXNRpNSusYK+IV/hUJchAKJ2n5VPQjYUhtcE0iHO81neMHkOkm70KJ9LbS1yHbc09RqEdHbJXcXr/RRJpbrQw8I0r2Gj8F4xRPAIZZEdtWNZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759103091; c=relaxed/simple;
	bh=sJsUEYDm04IlD5BcEzyeHcZnTd3/h7nvQDAwSSwBfB8=;
	h=From:To:Cc:Subject:Date:References:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=djN3jwimFZ7zqt68vuiNjngXhOV9T46Pw0HjujrtSocofD+8+134qD38AnZTxqqnq2mQIUoy8jsiTzsMPz95MQbap9q+VRvTuJDPWH1SNhvLQtl/fpvSI/hpyPlVB850km9WJhO2Cy0M01/7iOg3Cbtgr5SjWYho5oIEJccHL4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/JZMff2; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/JZMff2"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-330469eb750so4547098a91.2
        for <llvm@lists.linux.dev>; Sun, 28 Sep 2025 16:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759103088; x=1759707888; darn=lists.linux.dev;
        h=mime-version:message-id:in-reply-to:user-agent:references:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6uZqv7BF8fxgj0fdChKvhdHEIE5MC9E1zQaVfiqjeLk=;
        b=Y/JZMff2PqluwWFz9TuzMZhl7Vk17Xj0J7zWW+WWvp4jD5T6CWSL5VA6Uri8bMzaEF
         OZiQMvrf0ns3BsipCx+jkBFj9jdKFT1GdwNENsNUcm132Ly8I/1fYt9+iaTzzwukKjP5
         n6gtbK/86Y6etoAbwGWtK3Cuo4zyl4Ljw2SpHkoVchvxDMOMqqt0Ew8SgK+X+KVS5MQT
         zXF7JRRlmzMBAjqK7WMgkmZY7vCPS4hS7sf50V9V5716UqDW9xd1kA3PQlWLMZyxx9K2
         fSGatxamJJvs45gQs/VUkzY4QSHwRcKt6s00sbar7o/GC0nHWOkIRV0/SINvrpbgioCR
         v2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759103088; x=1759707888;
        h=mime-version:message-id:in-reply-to:user-agent:references:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uZqv7BF8fxgj0fdChKvhdHEIE5MC9E1zQaVfiqjeLk=;
        b=N0xNYJjqXFJA+8bGXP+g8jvmxC6sztmNj2IBf3PLc/WZMWAXZdOoowLIkSusUR2QR3
         jIDCZzZ6FXjms2zTUlIhPYore+4VSv6YlfvaAMMFZ1UJLqNpdKlsEAIaRC+HPpOVmEjd
         +eTNrNzrwfEMghvKy6EnXXNh4AcDRjsjAY+zqnDEYutL6mYQmBwnD3wFc2Jpr1uHCpCt
         ufZ1Sd7ovEs0mllTr0H5NjPTeXur/gdFwYqG4EzJT1ezev0xOEOqRPVSbVLUDjFzApK1
         rEB7P7JaUmGtlSCEG1npkaD8BujRvdjZ4jk1O78oJuQjlirbnIxUqD7qKxh8K45Lhrn4
         DUZw==
X-Forwarded-Encrypted: i=1; AJvYcCXqZ/smGrZgdsqnhd9PTpqo4Ug2JWii6VunBK/krbcjdoey5xo2SmMc/dcx+wdTFxuVUafS@lists.linux.dev
X-Gm-Message-State: AOJu0YwlNvCZQN/d/A/9xROIabkqS6hzcnm34wFMwdQk52OOWT+Ij543
	nGeCz8T+C62Tdwjt9xiMrLsKn2P7YFRIu6A3yULgPGmVKnobYV3EsvCR
X-Gm-Gg: ASbGncuX8qkgjTcKqV+EUXn7UZ1NnB7JMOocjZm46miLLo5aV4uH134iLRrtmuG3N05
	ZtjxbjK5Ym8GqK5goVfOL9j5IZkuvlfDtgIb2YDGouaw2PZj0Q7YYx4BrSEhdtycSTen7h7wCbP
	VJrEMlJKuR6tmpB65UKBxphDdcmML/jvQh8oy86IXL7m6Br4a2ymKe6Yl7AbNu+1PKNcUUXWcIZ
	fKZ0Jau4qTAGW8udzImTlObymrmEkZylEPsWOmEqHcBrLcc3iTSPaIJBIUtHHfUh+RkK3DsAQDX
	lmW1bMKbGjaFNHuRAVndm9ZISAVaZmpDLrX3iCpSKQnCGi8vbsS4R2SfL4sAyG7FbqEjBG8tJcs
	jEqL0OxjF6GBtuLMPJuetXok=
X-Google-Smtp-Source: AGHT+IFj//9uz6PZ64Fp8xLgbmwavKPz7itU0iNGPQP1qHGouTJGs8TCRcD5CUA+pCELoLRzDCisFA==
X-Received: by 2002:a17:90b:4b8b:b0:32e:9a24:2df9 with SMTP id 98e67ed59e1d1-3342a26c34fmr16883085a91.14.1759103088488;
        Sun, 28 Sep 2025 16:44:48 -0700 (PDT)
Received: from 1337 ([136.159.213.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33474b1f455sm11587891a91.24.2025.09.28.16.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 16:44:47 -0700 (PDT)
From: Abhinav Saxena <xandfury@gmail.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, Paul Moore
 <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, Daniel Verkamp
 <dverkamp@chromium.org>, Jeff Xu <jeffxu@chromium.org>, =?utf-8?Q?Thi?=
 =?utf-8?Q?=C3=A9baud_Weksteen?= <tweek@google.com>, Stephen Smalley
 <stephen.smalley.work@gmail.com>
Subject: Re: [PATCH RFC 0/4] landlock: add LANDLOCK_SCOPE_MEMFD_EXEC execution
Date: Sun, 28 Sep 2025 17:37:02 -0600
References: <20250719-memfd-exec-v1-0-0ef7feba5821@gmail.com>
 <20250918.io7too8ain7A@digikod.net>
User-agent: mu4e 1.10.8; emacs 30.2
In-reply-to: <20250918.io7too8ain7A@digikod.net>
Message-ID: <878qhy2lch.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks for the detailed reply Micka=C3=ABl!

Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> writes:

> Thanks for this patch series Abhinav!  The code looks good overall, but
> we should clarify the design.  Sorry for the delayed response, it is on
> my radar now.
>
> CCing Jeff and Daniel
>
> On Sat, Jul 19, 2025 at 05:13:10AM -0600, Abhinav Saxena wrote:
>> This patch series introduces LANDLOCK_SCOPE_MEMFD_EXEC, a new Landlock
>> scoping mechanism that restricts execution of anonymous memory file
>> descriptors (memfd) created via memfd_create(2). This addresses security
>> gaps where processes can bypass W^X policies and execute arbitrary code
>> through anonymous memory objects.
>>=20
>> Fixes: <https://github.com/landlock-lsm/linux/issues/37>
>>=20
>> SECURITY PROBLEM
>> `=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D'
>>=20
>> Current Landlock filesystem restrictions do not cover memfd objects,
>> allowing processes to:
>>=20
>> 1. Read-to-execute bypass: Create writable memfd, inject code,
>>    then execute via mmap(PROT_EXEC) or direct execve()
>> 2. Anonymous execution: Execute code without touching the filesystem via
>>    execve(=E2=80=9C/proc/self/fd/N=E2=80=9D) where N is a memfd descript=
or
>
>> 3. Cross-domain access violations: Pass memfd between processes to
>>    bypass domain restrictions
>
> Landlock only restricts access at open time, which is a useful property.
> This enables to create more restricted sandboxes but still get access to
> outside resources via trusted processes.  If the process passing the FDs
> is not trusted, the sandboxed process could just ask to execute
> arbitrary code outside the sandbox anyway.
>
> However, the Landlock scopes are designed to block IPC from within a
> sandbox to outside the sandbox.  We could have a new scope to forbid a
> sandbox process to receive or inherit file descriptors, but that would
> be a different and generic feature.  For compatibility reasons, this
> might not be easy to implement and I think there are more important
> features to implement before that.
>
> Thinking more about it, restricting memfd should not be a =E2=80=9Cscoped=
=E2=80=9D flag
> because the semantic is not the same, but we should have a new ruleset
> property instead, something like =E2=80=9Cruleset.denied=E2=80=9D with a =
related
> LANDLOCK_DENY_EXECUTE_MEMFD flag.  This flag will only have an impact on
> newly created memfd from a sandboxed process with this restriction at
> creation time. This could be implemented with hook_file_alloc_security()
> by checking if the file is indeed a memfd and checking inode->i_mode for
> executability bits (which would imply MFD_NOEXEC_SEAL).
>

Thanks for the clarification! So if I understood correctly we are
proposing adding a `denied` field to the `landlock_ruleset_attr` struct

struct landlock_ruleset_attr {
    __u64 handled_access_fs;
    __u64 handled_access_net;
    __u64 scoped;
    __u64 denied;              /* New field */
};

which allows memfd_create() to be allowed by default unless
LANDLOCK_DENY_EXECUTE_MEMFD bit is set. Also it seems Thi=C3=A9baud
Weksteen=E2=80=99s patch[1] will land, and maybe we can use
security_inode_init_security_anon instead? What do you think?

Apologies for my ignorance, do we have to wait till his patch has
landed into Linus=E2=80=99s tree?

>>=20
>> These scenarios can occur in sandboxed environments where filesystem
>> access is restricted but memfd creation remains possible.
>>=20
>> IMPLEMENTATION
>> `=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D'
>>=20
>> The implementation adds hierarchical execution control through domain
>> scoping:
>>=20
>> Core Components:
>> - is_memfd_file(): Reliable memfd detection via =E2=80=9Cmemfd:=E2=80=9D=
 dentry prefix
>> - domain_is_scoped(): Cross-domain hierarchy checking (moved to domain.c)
>> - LSM hooks: mmap_file, file_mprotect, bprm_creds_for_exec
>> - Creation-time restrictions: hook_file_alloc_security
>>=20
>> Security Matrix:
>> Execution decisions follow domain hierarchy rules preventing both
>> same-domain bypass attempts and cross-domain access violations while
>> preserving legitimate hierarchical access patterns.
>>=20
>> Domain Hierarchy with LANDLOCK_SCOPE_MEMFD_EXEC:
>> `=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D'
>>=20
>> Root (no domain) - No restrictions
>>   |
>>   +=E2=80=93 Domain A [SCOPE_MEMFD_EXEC] Layer 1
>>   |     +=E2=80=93 memfd_A (tagged with Domain A as creator)
>>   |     |
>>   |     +=E2=80=93 Domain A1 (child) [NO SCOPE] Layer 2
>>   |     |     +=E2=80=93 Inherits Layer 1 restrictions from parent
>>   |     |     +=E2=80=93 memfd_A1 (can create, inherits restrictions)
>>   |     |     +=E2=80=93 Domain A1a [SCOPE_MEMFD_EXEC] Layer 3
>>   |     |           +=E2=80=93 memfd_A1a (tagged with Domain A1a)
>>   |     |
>>   |     +=E2=80=93 Domain A2 (child) [SCOPE_MEMFD_EXEC] Layer 2
>>   |           +=E2=80=93 memfd_A2 (tagged with Domain A2 as creator)
>>   |           +=E2=80=93 CANNOT access memfd_A1 (different subtree)
>>   |
>>   +=E2=80=93 Domain B [SCOPE_MEMFD_EXEC] Layer 1
>>         +=E2=80=93 memfd_B (tagged with Domain B as creator)
>>         +=E2=80=93 CANNOT access ANY memfd from Domain A subtree
>>=20
>> Execution Decision Matrix:
>> `=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D'
>> Executor->  |  A  | A1 | A1a | A2 | B  | Root
>> Creator     |     |    |     |    |    |
>> =E2=80=94=E2=80=94=E2=80=94=E2=80=94|=E2=80=94=E2=80=93|=E2=80=94-|=E2=
=80=94=E2=80=93|=E2=80=94-|=E2=80=94-|=E2=80=94=E2=80=93
>> Domain A    |  X  | X  | X   | X  | X  |  Y
>> Domain A1   |  Y  | X  | X   | X  | X  |  Y
>> Domain A1a  |  Y  | Y  | X   | X  | X  |  Y
>> Domain A2   |  Y  | X  | X   | X  | X  |  Y
>> Domain B    |  X  | X  | X   | X  | X  |  Y
>> Root        |  Y  | Y  | Y   | Y  | Y  |  Y
>>=20
>> Legend: Y =3D Execution allowed, X =3D Execution denied
>
> Because checks should not be related to scopes, this will be much
> simpler.
>
>>=20
>> Scenarios Covered:
>> - Direct mmap(PROT_EXEC) on memfd files
>> - Two-stage mmap(PROT_READ) + mprotect(PROT_EXEC) bypass attempts
>> - execve("/proc/self/fd/N") anonymous execution
>> - execveat() and fexecve() file descriptor execution
>> - Cross-process memfd inheritance and IPC passing
>>=20
>> TESTING
>> `=3D=3D=3D=3D=3D'
>>=20
>> All patches have been validated with:
>> - scripts/checkpatch.pl =E2=80=93strict (clean)
>> - Selftests covering same-domain restrictions, cross-domain=20
>>   hierarchy enforcement, and regular file isolation
>> - KUnit tests for memfd detection edge cases
>
> Thanks for all these tests!
>
>>=20
>> DISCLAIMER
>> `=3D=3D=3D=3D=3D=3D=3D=3D'
>>=20
>> My understanding of Landlock scoping semantics may be limited, but this
>> implementation reflects my current understanding based on available
>> documentation and code analysis. I welcome feedback and corrections
>> regarding the scoping logic and domain hierarchy enforcement.
>>=20
>> Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
>> =E2=80=94
>> Abhinav Saxena (4):
>>       landlock: add LANDLOCK_SCOPE_MEMFD_EXEC scope
>>       landlock: implement memfd detection
>>       landlock: add memfd exec LSM hooks and scoping
>>       selftests/landlock: add memfd execution tests
>>=20
>>  include/uapi/linux/landlock.h                      |   5 +
>>  security/landlock/.kunitconfig                     |   1 +
>>  security/landlock/audit.c                          |   4 +
>>  security/landlock/audit.h                          |   1 +
>>  security/landlock/cred.c                           |  14 -
>>  security/landlock/domain.c                         |  67 ++++
>>  security/landlock/domain.h                         |   4 +
>>  security/landlock/fs.c                             | 405 ++++++++++++++=
++++++-
>>  security/landlock/limits.h                         |   2 +-
>>  security/landlock/task.c                           |  67 =E2=80=94-
>>  =E2=80=A6/selftests/landlock/scoped_memfd_exec_test.c    | 325 ++++++++=
+++++++++
>>  11 files changed, 812 insertions(+), 83 deletions(-)
>> =E2=80=94
>> base-commit: 5b74b2eff1eeefe43584e5b7b348c8cd3b723d38
>> change-id: 20250716-memfd-exec-ac0d582018c3
>>=20
>> Best regards,
>> =E2=80=93=20
>> Abhinav Saxena <xandfury@gmail.com>
>>=20
>>=20

Best,
Abhinav

[1] - <https://lore.kernel.org/all/20250918020434.1612137-1-tweek@google.co=
m/>

--=-=-=--
