Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393C51272D0;
	Thu,  7 Mar 2024 11:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709809353; cv=none; b=N82WPjwVMbChxo+sxJIjCKFZwMSKa376uN6aNqYuU0TrmkBIVFp27BdHvmOU7dhQWK0vHY4WKyN3Ji1gPQmjRfYYN2TX589DApOLVteYaLhDSeJnFCvJiSx5iXxBHR7VLvGJQ/4xOiznM94Iymm57ZaYyTzoh3h1vau/YsgbNm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709809353; c=relaxed/simple;
	bh=oUvHjMRRxLoY+qH9AnMA3VyQBA9Q3Y1dtSOejG2LZu4=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=X1nhLX4504uhR71nQteoPooQK9smBrkNiLq7HxTR2WVylTo5aWkNWSBDnPO1gTnYedk+ChlHAzmgZO7oQUAUs7MvKcRsUjvBfD1w8MCtqFsTZCkj5F4SOtBgQQtKcnFouWXs+Z1Ow1rJqnj+8LRI7Z8oxjbxMdxQY1ovrVH6TCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=sTrO4U5X; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="sTrO4U5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709809350;
	bh=oUvHjMRRxLoY+qH9AnMA3VyQBA9Q3Y1dtSOejG2LZu4=;
	h=Subject:From:To:Cc:Date:From;
	b=sTrO4U5X8KDBpWblwWDUDW9DXAHwxGdmem1zifAIlL7kjZi/ANnDJ7wh8bUjUUtdD
	 QmL8Uqp6H0Egdp3hdv1wprMEWB21zWR7jME6NaphisUJmPmnlD9o238U9gDL5+ZYGd
	 keGxf859MOkyka5OWwXESTb/pVKtaJOJJ2Jli2KndqsrkoLRq6ONokKOiVbHr8gJec
	 tFdRduNsHsyUqb4VMbhZ8+h/YvEVEaVLYLbgjH960fPolGBrsoKhTufdX27azfltg1
	 5rkS28XCygA1Z22yYD9nyWQfsPR5VB7MT2/jJE2b22iOxSGqR+ulHBkDkVWvU5hs91
	 0HTPPKMfpJjMA==
Received: from [100.113.176.132] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nuclearcat)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1487C378149B;
	Thu,  7 Mar 2024 11:02:29 +0000 (UTC)
Message-ID: <42c7f5a3e07c274c2a9d2e45a973c6306b2ba74f.camel@collabora.com>
Subject: Migration to Debian Bookworm and compiler updates for KernelCI
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@lists.linux.dev
Cc: Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux
	 <llvm@lists.linux.dev>
Date: Thu, 07 Mar 2024 13:02:26 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello,

I'm reaching out on behalf of the KernelCI project team to discuss our
current compiler setup and planned migration to Debian Bookworm.

As you may know, our compiler images are currently based on Debian
Bullseye, which is approaching its end of life in July 2024. We have
been testing using gcc-10, which has presented us with some recent
challenges, notably a significant bug that results in false positive
compilation errors (specifically, the -Werror memcpy issue in
security.c). This situation has prompted us to consider an urgent
migration to Debian Bookworm. Additionally, the migration is
necessitated by our requirement to upgrade to a newer Python version to
support KernelCI v2 development efforts.

However, before we proceed, we have a couple of pending questions that
we hope to get clarity on:

1) We've noticed that the minimal available version of clang on
https://apt.llvm.org/bookworm/dists/ is 15, whereas our current minimal
requirement for the Linux kernel compilation is clang-13.0.1
(https://www.kernel.org/doc/html/next/process/changes.html). How
critical is it to continue providing compile tests for clang-13 (and
potentially clang-14)? This information would be vital for us in
planning our compiler support strategy moving forward.

2) We are also considering migrating to gcc-12 and would like to
inquire if the CIP (Civil Infrastructure Platform) could provide their
endorsement for this move. Should there be any reservations about
transitioning to gcc-12, we would greatly appreciate development
support in building gcc-10 for Bookworm. In the interim, we would like
to inquire if it's acceptable to continue using our current gcc-10
images based on Bullseye until such a migration is feasible.

We believe that addressing these questions is crucial for our project's
progression and ensuring that we maintain a robust and reliable build
environment for the Linux kernel. We eagerly await your feedback and
any recommendations you may have regarding our migration plan and
compiler version support.

Thank you for your time and consideration.

Best regards,

Denys Fedoryshchenko
