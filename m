Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9423A2E3F
	for <llvm@lists.linux.dev>; Tue, 23 Jun 2026 04:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782188760; cv=none; b=Ybw51MM1LR3++Ja0pJwQ+nr1H9Rb9ArVe0tOcrvuYaXZOPjDix7qMwbOZf8SNqK6e8DlID7ifhq1QICfFkSiUdHu7p9Npen/gX9ldEyjNWl/qferqG1hcXdHQcNN28KlxpP9BYs1UDmosBh3ePBXOrznsLi5E+Y862KULcHgpt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782188760; c=relaxed/simple;
	bh=wOPa1dqq+mlKJoifwWbp4RjsHBrFsS0BY3T7L5BB4Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWOzqFuFMYtMd91PkqFrlMl79O7qs31z5nEsDNkQuQZ4FR5WzFfu8VZs8WZ8D2RcQXQ/15O+A/Xfp/dcHFwYBMh6cdjHtG8X/ek2tI/8Hd6gBlG3vPRbiemuc8JwMwJ+CBTEbtDjq0cbm9MzhoT8G2LQncKB019EZGLSs0s8peA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqIdEt6i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqIdEt6i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8C41F00A3D
	for <llvm@lists.linux.dev>; Tue, 23 Jun 2026 04:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782188759;
	bh=WImKe0gNySjp3D4JqCdv0qGJ8o/akw0TckF/LbQn0u8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mqIdEt6iNzTvPHpN0ep6GPsFmKeUfxoxrYt9fqJttuJqbnl9w9Tw92HPaYO+e7tNK
	 orrG9WX2h5nrVZVdMjYARwDq4b5txT2Mcrg3cNxO3VBivs/ASkL46NVgl9rI3quwIm
	 fZL8eLLXoQL8iBHOglZgexFryyOu802UjrbEpj7rKe4niE5PYRnNbbiv+b2QtVCRwz
	 UuWFjZ+Ten2PEztWhlg+YmbZvCQXqGZdhZ343zFacZ3M1oXaTdY91IfI/iyQsjCEh/
	 0WxmPe+CGuxlx3redp6txtOUhF8z3tMiqkbTJ8w0SocjdDq+yh/Pr+rslV9suhLNe5
	 Dwg7K7lRRRX2w==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-697bd41a4ecso1840897a12.2
        for <llvm@lists.linux.dev>; Mon, 22 Jun 2026 21:25:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YzQ2FOnkateB/hkbQa8wdk2MOGJDpRLv5gp0Fq5eMjkcHK7jQcG
	fI8Xh5tM7wSHSapdmfkCi8qGCqdDPxeoeMU29zEETG1NN9Tn4apOuymyzwPnOZ4LhDfIqT1gfvh
	ZwVvuLpdgfgm6QsxSE+jWsX7uHc8svis=
X-Received: by 2002:a17:907:1caa:b0:bd1:ba38:c724 with SMTP id
 a640c23a62f3a-c108ecf75dcmr38361366b.32.1782188758450; Mon, 22 Jun 2026
 21:25:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606231232.Q1v04anI-lkp@intel.com>
In-Reply-To: <202606231232.Q1v04anI-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 23 Jun 2026 13:25:45 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8oAmaFo=Df1vfUx--iA5JrdTmNQjJjuzmrV+25YMHK3w@mail.gmail.com>
X-Gm-Features: AVVi8CfJCG_UuYHKmw7vugRktWd5DKRHawdcUby9I8ObpawwAD9IBgHhe9pwj8E
Message-ID: <CAKYAXd8oAmaFo=Df1vfUx--iA5JrdTmNQjJjuzmrV+25YMHK3w@mail.gmail.com>
Subject: Re: [linux-next:master 14744/14955] ERROR: modpost:
 "__hexagon_moddi3" [fs/smb/server/ksmbd.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Steve French <stfrench@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 1:19=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   948efecf22e49aa4bf55bb73ec79a0ddcfd38571
> commit: 64ab25180b27fff29912cbf1728bd1ce46119156 [14744/14955] ksmbd: ret=
urn requested create allocation size
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/202=
60623/202606231232.Q1v04anI-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a=
9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260623/202606231232.Q1v04anI-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606231232.Q1v04anI-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "__hexagon_moddi3" [fs/smb/server/ksmbd.ko] undefined!
We have already fixed it and applied it to our tree.
Thanks for the report.
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
