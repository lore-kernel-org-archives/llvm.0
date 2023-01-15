Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFC91366;
	Sun, 15 Jan 2023 14:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73752C433D2;
	Sun, 15 Jan 2023 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673792069;
	bh=EvGEQ7u39+taKoDMf5d9jjV5Rwv8HCE3B95mKlhXVr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zn1rkTI8QJ5BKucDQQcgS71svB8c75bujhU7AyQstnrIj8SMa28y0YtuOeu86DKZc
	 iysF491gHLjbkzWULrBXHdRKIB6Fa3wdlXtITG+9pao/Bz/bHhql/R83vCvAvO1Eli
	 EtxONBvJgNIY4GiH9E3S7RvPDmCKuqtUljm9t2+o=
Date: Sun, 15 Jan 2023 15:14:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>
Subject: Re: [stable:linux-5.15.y 1642/9999] ERROR: Input tree has errors,
 aborting (use -f to force output)
Message-ID: <Y8QKQ1XKEZvtmJYc@kroah.com>
References: <202301150959.RAvfuBjG-lkp@intel.com>
 <aa73cfb8-99ed-20b4-071c-9858399aee0a@arinc9.com>
 <CAMhs-H_fykbcZjSQ0LKOmtWMLjekDgUHsJjNNqSvYvbY=wbkHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMhs-H_fykbcZjSQ0LKOmtWMLjekDgUHsJjNNqSvYvbY=wbkHQ@mail.gmail.com>

On Sun, Jan 15, 2023 at 01:52:58PM +0100, Sergio Paracuellos wrote:
> On Sun, Jan 15, 2023 at 10:05 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
> >
> > Sergio, this issue hasn't seem to gone away. If you haven't sent the
> > patch you mentioned here [1], I think Greg taking your upstream commit
> > [2] to 5.15.y tree would be the easiest solution.
> >
> > [1]:
> > https://lore.kernel.org/all/CAMhs-H8BLheXBc+BcDH_PKmDg+_bWF9OmiS_grw1mO+RxW+J8Q@mail.gmail.com/
> > [2]:
> > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/drivers/staging/mt7621-dts/mt7621.dtsi?id=ce835dbd04d7b24f9fd50d9a9c59be46304aaa8a
> 
> I forgot I sent [2] at some point :). Yes, taking directly that patch
> sounds easier.

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
