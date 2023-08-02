Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A438C125C4
	for <llvm@lists.linux.dev>; Wed,  2 Aug 2023 21:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B50C433C7;
	Wed,  2 Aug 2023 21:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691011929;
	bh=2PaiUpifeCse/HhykZzsGpNNXYxG9/8BdqoWXV5HhD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7rkboeJ9wyO/0xDXw25KM79GOP/Sk2hWmAI6yRgz0OJU1LXNc2VZ2EcDlvmlMojT
	 oMLdl0v5KEOEh+JZGN/GPMZ9A8PTwps+ZAtjXriNCBvY8zOFKeQBRMh8LjXmxnh5Ww
	 xjYq4xPI7wQ3kWExVVDWvafRG5phJKYNgCZ44oZXgJ3lQTsG5VDSx1/Q2KWCjczcgb
	 XR1vQ7OJv3KOZXHPwylTLzLO9nJhm9AOovT8APRuHBt/bEGgzMajgP/pCPaPqpg82t
	 gNkvvLIHf7PYBKWX989l4eHHC58SdhW1/SRhRkg7ol9qzJfvCclAHdfThEQ6/AP+cv
	 di/Khv2+8EUWQ==
Date: Wed, 2 Aug 2023 14:32:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>, linux-clk@vger.kernel.org,
	tsbogend@alpha.franken.de, sboyd@kernel.org,
	mturquette@baylibre.com, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: ralink: mtmips: quiet unused variable warning
Message-ID: <20230802213206.GA758420@dev-arch.thelio-3990X>
References: <20230802092647.3000666-1-sergio.paracuellos@gmail.com>
 <CAKwvOd=SvHUPd8+sWtqgxghPEciD5sqPiggZx+OOEqxtJrML6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=SvHUPd8+sWtqgxghPEciD5sqPiggZx+OOEqxtJrML6Q@mail.gmail.com>

On Wed, Aug 02, 2023 at 02:26:43PM -0700, Nick Desaulniers wrote:
> On Wed, Aug 2, 2023 at 2:26 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > When CONFIG_OF is disabled then the matching table is not referenced and
> > the following warning appears:
> >
> > drivers/clk/ralink/clk-mtmips.c:821:34: warning: unused variable 'mtmips_of_match' [-Wunused-const-variable]
> > 821 |   static const struct of_device_id mtmips_of_match[] = {
> >     |                          ^
> >
> > Silence it declaring 'mtmips_of_match' with '__maybe_unused'.
> >
> > Fixes: 6f3b15586eef ("clk: ralink: add clock and reset driver for MTMIPS SoCs")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202307242310.CdOnd2py-lkp@intel.com/
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> 
> I think this is fine; Arnd or Nathan do you have a preference? or thoughts here?

I do not have much of a preference either, I tend to agree with your
reasoning for preferring the #ifdef but '__maybe_unused' is relatively
easy to audit on a per-file basis and I think that is more common than
the '#ifdef CONFIG_OF'.

Small nit, I think __maybe_unused typically goes between the variable
name and equals, like

  static const struct of_device_id mtmips_of_match[] __maybe_unused = {

but this is obviously fine. Regardless:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> If not, thanks for the patch.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> (I have a slight preference for wrapping the use in `#ifdef CONFIG_OF`
> since with the approach used by this patch, if all users are removed
> we will never get a warning for this var. But it's a weak preference;
> it's more important to me that we don't have -Werror promote this
> warning to a build breakage)
> 
> > ---
> >  drivers/clk/ralink/clk-mtmips.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/ralink/clk-mtmips.c b/drivers/clk/ralink/clk-mtmips.c
> > index 1e7991439527..6716394b28a3 100644
> > --- a/drivers/clk/ralink/clk-mtmips.c
> > +++ b/drivers/clk/ralink/clk-mtmips.c
> > @@ -820,7 +820,7 @@ static const struct mtmips_clk_data mt76x8_clk_data = {
> >         .num_clk_periph = ARRAY_SIZE(mt76x8_pherip_clks),
> >  };
> >
> > -static const struct of_device_id mtmips_of_match[] = {
> > +static const __maybe_unused struct of_device_id mtmips_of_match[] = {
> >         {
> >                 .compatible = "ralink,rt2880-sysc",
> >                 .data = &rt2880_clk_data,
> > --
> > 2.25.1
> >
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
