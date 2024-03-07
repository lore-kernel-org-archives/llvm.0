Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6200F12D750;
	Thu,  7 Mar 2024 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820165; cv=none; b=dIfbpdHC6ZiODDgLoD3BRx3wAv2hkQsh3aa0tUSZTPZcBL7X7vyY5JA6Eoa2BsTuFl8oik+ewMJEAv+ujwfXrkDAtw7pz55ks51Ra1ptFCYWltNf4JbtKoyckjNSLugBCwkZqVUTF7sxGPvo1YiaDl+96lgcv02YjqqiUbpkeiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820165; c=relaxed/simple;
	bh=1WbpOxrHwJ1hBM0xTcemHqvLkUCZEbeLeizaVm+mW8E=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=tAUOno8wAoueWAif7KEL6HES13OMQVwb0v332SnFE/quPnj/wn5Bs1zUACVWXzLuzqR/6NGuXhNztcwB7Wnev18vvx0rMCvwEX+qwWu0EPZ6Cd9JcB8fdtv+7Q9N+oxwcg4RaHlV2gQbl7DsyAIjif17nvtsB1LvOg7sqFwsACM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from harlem.collaboradmins.com (harlem.collaboradmins.com [IPv6:2a01:4f8:1c0c:5936::1])
	by madrid.collaboradmins.com (Postfix) with ESMTP id 08BD23780B5F;
	Thu,  7 Mar 2024 14:02:35 +0000 (UTC)
From: "Gustavo Padovan" <gustavo.padovan@collabora.com>
In-Reply-To: <CAKXUXMzbZu_7piNcKK5c7Q4pR6KRaY4xuxSuvrNS07MTHE7X7w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
References: <42c7f5a3e07c274c2a9d2e45a973c6306b2ba74f.camel@collabora.com> <CAKXUXMzbZu_7piNcKK5c7Q4pR6KRaY4xuxSuvrNS07MTHE7X7w@mail.gmail.com>
Date: Thu, 07 Mar 2024 14:02:35 +0000
Cc: "Denys Fedoryshchenko" <denys.f@collabora.com>, kernelci@lists.linux.dev, "Nick Desaulniers" <ndesaulniers@google.com>, "clang-built-linux" <llvm@lists.linux.dev>, cip-dev@lists.cip-project.org
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <140e78-65e9c900-3b-56c0a580@153911509>
Subject: =?utf-8?q?Re=3A?= Migration to Debian Bookworm and compiler updates for 
 KernelCI
User-Agent: SOGoMail 5.10.0
Content-Transfer-Encoding: quoted-printable

+cip-dev for feedback on compiler usage for cip needs in KernelCI.

On Thursday, March 07, 2024 08:19 -03, Lukas Bulwahn <lukas.bulwahn@gma=
il.com> wrote:

> On Thu, Mar 7, 2024 at 12:02=E2=80=AFPM Denys Fedoryshchenko
> <denys.f@collabora.com> wrote:
> >
> > Hello,
> >
> > I'm reaching out on behalf of the KernelCI project team to discuss =
our
> > current compiler setup and planned migration to Debian Bookworm.
> >
> > As you may know, our compiler images are currently based on Debian
> > Bullseye, which is approaching its end of life in July 2024. We hav=
e
> > been testing using gcc-10, which has presented us with some recent
> > challenges, notably a significant bug that results in false positiv=
e
> > compilation errors (specifically, the -Werror memcpy issue in
> > security.c). This situation has prompted us to consider an urgent
> > migration to Debian Bookworm. Additionally, the migration is
> > necessitated by our requirement to upgrade to a newer Python versio=
n to
> > support KernelCI v2 development efforts.
> >
> > However, before we proceed, we have a couple of pending questions t=
hat
> > we hope to get clarity on:
> >
> > 1) We've noticed that the minimal available version of clang on
> > https://apt.llvm.org/bookworm/dists/ is 15, whereas our current min=
imal
> > requirement for the Linux kernel compilation is clang-13.0.1
> > (https://www.kernel.org/doc/html/next/process/changes.html). How
> > critical is it to continue providing compile tests for clang-13 (an=
d
> > potentially clang-14)? This information would be vital for us in
> > planning our compiler support strategy moving forward.
> >
> > 2) We are also considering migrating to gcc-12 and would like to
> > inquire if the CIP (Civil Infrastructure Platform) could provide th=
eir
> > endorsement for this move. Should there be any reservations about
> > transitioning to gcc-12, we would greatly appreciate development
> > support in building gcc-10 for Bookworm. In the interim, we would l=
ike
> > to inquire if it's acceptable to continue using our current gcc-10
> > images based on Bullseye until such a migration is feasible.
> >
> > We believe that addressing these questions is crucial for our proje=
ct's
> > progression and ensuring that we maintain a robust and reliable bui=
ld
> > environment for the Linux kernel. We eagerly await your feedback an=
d
> > any recommendations you may have regarding our migration plan and
> > compiler version support.
> >
> > Thank you for your time and consideration.
> >
>=20
>=20
> If you want to get feedback from the CIP project, it might be good to
> kick off the discussion on their public mailing list:
>=20
> https://lists.cip-project.org/g/cip-dev
>=20
> It seems a busy mailing list with a lot of automated email reports,
> but maybe you do get through to the real listeners.
>=20
> Best regards,
>=20
> Lukas
>

