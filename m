Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B4A21660D
	for <llvm@lists.linux.dev>; Sun,  4 May 2025 17:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746380188; cv=none; b=YOGWL5pOwZcRsJnvbxXnmfnIwo5fypuSZIFfk10BPSIdJJxia3b1eG2vgRxag5Q9kEXAJAlHamcWxzhzAwcle1beq+R9R4nEfCDoHWwIyKohQFDQQgvzM1ZJTAAJDPIGfspyyDf2rKqjePfIivDMzy25JDmSwzu6lOszPuoP1CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746380188; c=relaxed/simple;
	bh=PKto6XWHPw3qkf98Cr2fpVFSXZupXtz55RQHLXKhy38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWRFLXpiPgrvYuyNApdLi+8DPPgGx5nfE31TjLLmXxkn34qJosvGkbSCHWqXsHjCOuGh6ZOulothleWeRvj82TWL27fFj4/SXeuk1/HEhJ6vOitUjSCXPj6m+gySK3AkrwUVjycoCmHyzpxIpun7k1zfKqgZ6j4WXjYupdBCdRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=SfdGCjL8; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="SfdGCjL8"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70821dba48eso28669407b3.0
        for <llvm@lists.linux.dev>; Sun, 04 May 2025 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1746380183; x=1746984983; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXXRsHPoH/0YETZ7MLRenRDro5Q1bAftLTE63l4umNc=;
        b=SfdGCjL8+vQfK8WiGwlQSSHr5TTNLJpzoIYvMeWaAof/P/8RIy6Mz8lixCI3RWxBlc
         m/Wwjgk/55XmfOf7FIm6eWW0DPN6Rm2c/UZL/hPrIXtGmn2lM2gXrdxa4c9JIRE5/gdV
         n2baM2sLUEFbEi59jNry6gPoXcdgc7srhmLbAxPkfvsFNLC0QXzrAnf1+9/XG2PnJD+I
         cNe+OcDlJLR4jB0f4E5Zddm8OLA31g+4JtxaX2QXOqyJ+p0ekUYsUQmmR4y089HKBIlB
         xDykpwUXkLxGmr883nzNbz80InMWaDt2rcv9EDOIiAaUisWDW5ccB7KoIKrMxGyjnIH+
         1lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746380183; x=1746984983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXXRsHPoH/0YETZ7MLRenRDro5Q1bAftLTE63l4umNc=;
        b=PJn1Z5gtSGPgK+4ewgtp8d/neCdfNQjV8HThzfvbf1V4b/jeLNMbBlM6axaeQiO0OB
         CLl9KG/UGSRYN1gd5sb5655eU/R1BSb3gKobVVNOq/d68xQ3f0Hw9aHU5wau7b5hP4jd
         J9r0dkQ5xIAZE33Hbd9dKgQo89F+fKBOcSN6qOQ7nddLtE8ZQj6Ii7jBXaj6RdO1YxdJ
         rn8x1g31PUn4cC46NJdXzErc5sQwUMSUVDQ1RszBfCUgJykiWx2Fu/x3SZ2OacKudj4c
         j2YwUR81Bkl2ZgmEhLFW2ZouhPX7k/AnQYf0zwmXf0ZifiXXD8u9dW4o/PEbCbif/CQX
         frRg==
X-Forwarded-Encrypted: i=1; AJvYcCWsExnrVam+tdV1sc6ZJxb0Opuyx8PMRx9OOkJcf2qhBt5eKJkVu0BImdc3rh7TIl/Icy7U@lists.linux.dev
X-Gm-Message-State: AOJu0YwzKDzDLu5rglRPtPUQnA1BbUa746B3jfMnGRtXmQaEa7ZNyI4J
	05Mkkm++dAFDhTRP00q57m/7/X7ZY/lzoHUP00r2Kz1FJIiaBExrIKPztvp7Eze7gUTizkRIwY0
	G41wjRvbkpyx3iEVgwXvx0gvzNtQPM4fKvl7X
X-Gm-Gg: ASbGncuo/oN9K78OkZvk3p3JVmolB//XiJhJnTeIFzB3igc0ShV/aVDxkhsCO6MH65D
	VPN2hc3FSO1eCQOeelfPkSW6OysNCUOfrzby1kspX5CKTW1c3wBdejJManME8gRMw+vcILxc89t
	mdrs/j/fiwqa2mqTuCSGHXWA==
X-Google-Smtp-Source: AGHT+IGH4iM2kOBwjguhM2tjRQ5NOwlV2cMNEshm7rCu9worhB26SxpY/yE7dTp6irnVpWrLXhT6tFSernyBUKKlH2U=
X-Received: by 2002:a05:690c:6385:b0:6ef:69b2:eac with SMTP id
 00721157ae682-708eaecbe4cmr56763087b3.4.1746380182785; Sun, 04 May 2025
 10:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502184421.1424368-1-bboscaccy@linux.microsoft.com> <20250502210034.284051-1-kpsingh@kernel.org>
In-Reply-To: <20250502210034.284051-1-kpsingh@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 4 May 2025 13:36:12 -0400
X-Gm-Features: ATxdqUG6G28ftr2F4dYbjsrK10lOxkoYxSdmHmsU_Sm_2J3in-8hzdqOgV_xvXY
Message-ID: <CAHC9VhS5Vevcq90OxTmAp2=XtR1qOiDDe5sSXReX5oXzf+siVQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introducing Hornet LSM
To: KP Singh <kpsingh@kernel.org>
Cc: bboscaccy@linux.microsoft.com, James.Bottomley@hansenpartnership.com, 
	bpf@vger.kernel.org, code@tyhicks.com, corbet@lwn.net, davem@davemloft.net, 
	dhowells@redhat.com, gnoack@google.com, herbert@gondor.apana.org.au, 
	jarkko@kernel.org, jmorris@namei.org, jstancek@redhat.com, 
	justinstitt@google.com, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-security-module@vger.kernel.org, 
	llvm@lists.linux.dev, masahiroy@kernel.org, mic@digikod.net, morbo@google.com, 
	nathan@kernel.org, neal@gompa.dev, nick.desaulniers+lkml@gmail.com, 
	nicolas@fjasle.eu, nkapron@google.com, roberto.sassu@huawei.com, 
	serge@hallyn.com, shuah@kernel.org, teknoraver@meta.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 5:00=E2=80=AFPM KP Singh <kpsingh@kernel.org> wrote:
>
> > This patch series introduces the Hornet LSM. The goal of Hornet is to p=
rovide
> > a signature verification mechanism for eBPF programs.
> >
>
> [...]
>
> >
> > References: [1]
> > https://lore.kernel.org/bpf/20220209054315.73833-1-alexei.starovoitov@g=
mail.com/
> > [2]
> > https://lore.kernel.org/bpf/CAADnVQ+wPK1KKZhCgb-Nnf0Xfjk8M1UpX5fnXC=3Dc=
BzdEYbv_kg@mail.gmail.com/
> >
> > Change list: - v2 -> v3 - Remove any and all usage of proprietary bpf A=
PIs
>
> BPF APIs are not proprietary, but you cannot implement BPF program signin=
g
> for BPF users without aligning with the BPF maintainers and the community=
.
> Signed programs are a UAPI and a key part of how developers experience BP=
F
> and this is not how we would like signing to be experienced by BPF users.
>
> Some more feedback (which should be pretty obvious) but explicitly:
>
> * Hacks like if (current->pid =3D=3D 1) return 0; also break your threat =
model
>   about root being untrusted.

Speaking with Blaise off-list when that change was discussed, I
believe the intent behind that Kconfig option was simply for
development/transition purposes, and not for any long term usage.  My
understanding is that this is why it was a separate build time
configuration and not something that could be toggled at runtime, e.g.
sysctl or similar.

> * You also did not take the feedback into account:
>
>    new =3D map->ops->map_lookup_elem(map, &key);
>
>   This is not okay without having the BPF maintainers aligned, the same w=
ay as
>
>   https://patchwork.kernel.org/project/netdevbpf/patch/20240629084331.380=
7368-4-kpsingh@kernel.org/#25928981
>
>   was not okay. Let's not have double standards.

From my perspective these two patches are not the same.  Even on a
quick inspection we notice two significant differences.  First, Hornet
reads data (BPF maps) passed from userspace to determine if loading
the associated BPF program should be allowed to load; whereas the
patch you reference above had the BPF LSM directly modifying the very
core of the LSM framework state, the LSM hook data.  Secondly, we can
see multiple cases under net/ where map_lookup_elem() is either called
or takes things a step further and provides an alternate
implementation outside of the BPF subsystem, Hornet's use of
map_lookup_elem() doesn't appear to be a significant shift in how the
API is used; whereas the patch you reference attempted to do something
no other LSM has ever been allowed to do as it could jeopardize other
LSMs.  However, let us not forget perhaps the biggest difference
between Hornet and patchset you mentioned; the LSM community worked
with you and ultimately merged your static call patchset, I even had
to argue *on*your*behalf* against Tetsuo Handa to get your patchset
into Linus' tree.

I'm sorry you are upset that a portion of your original design for the
static call patchset didn't make it into Linus' tree, but ultimately
the vast majority of your original design *did* make it into Linus
tree, and the process to get there involved the LSM community working
with you in good faith, including arguing along side of you to support
your patchset against a dissenting LSM.

This might also be a good time to remind others who don't follow LSM
development of a couple other things that we've done recently in LSM
land to make things easier, or better, for BPF and/or the BPF LSM.
Perhaps the most important was the work to resolve a number of issues
with the LSM hook default values, solving some immediate issues and
preventing similar problems from occurring in the future; this was a
significant improvement and helped pave the way for greater
flexibility around where the BPF LSM could be inserted into the LSM
ordering.  There was also the work around inspecting and normalizing a
number of LSM hooks to make it easier for the BPF verifier to verify
BPF LSM callbacks; granted we were not able to normalize every single
LSM hook, but we did improve on a number of them and the BPF verifier
was able to take advantage of those improvements.

From what I've seen in Blaise's efforts to implement BPF signature
validation in the upstream kernel he has been working in good faith
and has been trying to work with the greater BPF community at each
step along the way.  He attempted to learn from previously rejected
attempts with his first patchset, however, that too was rejected, but
with feedback on how he might proceed.  Blaise took that feedback and
implemented Hornet, traveling to LSFMMBPF to present his idea to the
BPF community, as well as the usual mailing list postings.  When there
was feedback that certain APIs would not be permitted, despite being
EXPORT_SYMBOL'd, Blaise made some adjustments and came back to the
lists with an updated version.  You are obviously free to object to
portions of Hornet, but I don't believe you can claim Blaise isn't
trying to work with the BPF community on this effort.

> So for this approach, it's a:
>
> Nacked-by: KP Singh <kpsingh@kernel.org>

Noted.

> Now if you really care about the use-case and want to work with the maint=
ainers
> and implement signing for the community, here's how we think it should be=
 done:
>
> * The core signing logic and the tooling stays in BPF, something that the=
 users
>   are already using. No new tooling.

I think we need a more detailed explanation of this approach on-list.
There has been a lot of vague guidance on BPF signature validation
from the BPF community which I believe has partly led us into the
situation we are in now.  If you are going to require yet another
approach, I think we all need to see a few paragraphs on-list
outlining the basic design.

> * The policy decision on the effect of signing can be built into various
>   existing LSMs. I don't think we need a new LSM for it.
> * A simple UAPI (emphasis on UAPI!) change to union bpf_attr in uapi/bpf.=
h in
>   the BPF_PROG_LOAD command:
>
> __aligned_u64 signature;
> __u32 signature_size;

--=20
paul-moore.com
