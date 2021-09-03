Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5E572
	for <llvm@lists.linux.dev>; Fri,  3 Sep 2021 18:16:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0053E60F56;
	Fri,  3 Sep 2021 18:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630693011;
	bh=kOOqfyRHlgt1d//elGwr4bY98LcTsrsfEzSiXQx44dY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VwH7+eA1lM0Uedo6VlNhQyLHJWkQnljsYyY7+viElJakLTPG4NgXPxfceZQin7Tw5
	 4d/7cjzNjIKIncKuNLZsNRJt3JkA52FnNrFOqGoEG3c1RRMK2ZXh/YksNmJ2SnnZL3
	 kw/HwNTsdd+LgHrY4+2rOCA1GPsZJ3lKdPba6przIiv8IXxjkpG1MbqFal414e0Zyj
	 UT+bv0TbMvORB4ColvnfvZ6THoVdJRONgCpS4K0oITM4zTUka4Sdnpv0Z9uyEsiESW
	 zm3ReV5UReoVQbR7eSgt7duxmxSXxmvuS+99xvOEXRMn8A/aAtYxZtFZSgNOGYn+xN
	 Ek5cRMjxl3gjg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5b7edab0-4756-94d0-d601-050120cbf4cb@somainline.org>
References: <202109021640.TXyMlULd-lkp@intel.com> <85c61a79-3e83-84c8-1b75-3e4640ac3490@somainline.org> <163062849533.405991.5146021696613255539@swboyd.mtv.corp.google.com> <5b7edab0-4756-94d0-d601-050120cbf4cb@somainline.org>
Subject: Re: [linux-next:master 10841/11508] drivers/clk/qcom/gcc-sm6350.c:179:37: warning: unused variable 'gcc_parent_data_2'
From: Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>, kernel test robot <lkp@intel.com>
Date: Fri, 03 Sep 2021 11:16:49 -0700
Message-ID: <163069300975.405991.9420681174146548376@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1

Quoting Konrad Dybcio (2021-09-03 03:19:25)
> > Please send a patch.
>=20
>=20
> From a12e6478a26573babc0fd0df218bc908e80e4d5e Mon Sep 17 00:00:00 2001
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> Date: Fri, 3 Sep 2021 12:17:59 +0200
> Subject: [PATCH] clk: qcom: gcc-sm6350: Remove unused variable
>=20
> In the commit "clk: qcom: Add SM6350 GCC driver" (no hash yet) an unused
> variable has been overlooked. Remove it.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Thanks for the patch. I had to spend an extra minute applying it though
because it didn't apply properly.

Anyway, applied to clk-next.
