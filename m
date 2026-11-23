Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461437;
	b=gELj2m5F9dQGS3hnc2Qmjw24j8wwemyER2qcwZhbDiM2sf8IpjTsjstZyMgV5jcAz+L6
	 gQtGfnS7aEvrgkscDqF+v+PeoOQ2QXxL91m3uCYeYABca9xvLPUxLCpVjfyI0jkoncclW
	 M/Lk+VdklL+ciPe+jtavrGDerQLqYrhTXnHoR8zZUmPWArDmBhgZTtbykB7+0bKDQPmRQ
	 oYg4c4xRBiSaCzSU/08T/yvbOX+gNF1qW5772fCVb4Qbn1t+Mji39jxbnjwUNriR62x4C
	 S1hYYWb7bHJer6vYRIF2Mw3kNixlnsTb+rFLjIffrHrcOxXp9836UJBoUgCVeh2Tsiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461437;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UX6Zfd8/X0mtvuCH1KfRSlYqWCq9TgWX3+ywuOtFfk0=;
	b=PomR/+QWI4+ncXCcO4z6Vx2bPG/yKp4AdsCmscrQmMFohB4/IpWdqnwlutPn2iPNJj8F
	 CGTZgKLHvGeMiT1HFq0evodyd/n6sPJ0QN9LsZJJtfsunWR4S0tXrYXp5114xWNiNKAr5
	 CICp0ZNG7Ii3W+JRBd6g9bM4mR6qiIESq+KAvQtb/iCrrcNdjbaKF5O6Kh0WYoxM+6hHs
	 9EzGDSR+MPNUyEwxPuwv3Q8L5wbyQ+iTyatSV1+CLe6Nn28O4GMaRXw4o4T9B6H2jrYKS
	 JHAmIFdqduqP4DNZT0fay2ih4sL8qRFxt2KEb90MJf4m0/r/0xSEFqkMpvQeMVwumaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cIFWTCOq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19BA606A321;
	Mon, 23 Nov 2026 19:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cIFWTCOq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28E41F000C4;
	Mon, 23 Nov 2026 19:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461436;
	bh=UX6Zfd8/X0mtvuCH1KfRSlYqWCq9TgWX3+ywuOtFfk0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cIFWTCOqU92m9L4cI4346egZ0KQDvCsAXX7NQ8fgpBRP4VdCz31oTZYJ1IlAfbYIT
	 RD/Kf5D+nVGLmoZ1bnETQIeSRT2UzDFK0cJoG2n2cfVJtl5FL/bB94Scx8LrEOdrEn
	 tGY17iAxGIm/4LC4OeeXZzu44MoBMBivd0lwyUlzYTETHnjSxaQQszrQNvpy/y9hZT
	 IZRZ8i143MBrTYhSIKs7QDvzPIoPuZK8yK7fg+ErucoV3HpTbfXS2tewk2MYmBPgGB
	 WNci+tgkXNyRPMiCW4xtzpx5xahTQJtFu3cIHDrvUP6YJpV8p9gMkDHYmkT+FTQyD8
	 YZ7xp18T3AD2A==
Subject: Re: [PATCH net] tg3: Propagate PHY reset retry failures in
 tg3_phy_reset_5703_4_5()
From: netdev-bot+sashiko@kernel.org
To: irogers@google.com
Cc: pavan.chebbi@broadcom.com, michael.chan@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, elkin@google.com
Date: Mon, 23 Nov 2026 19:17:15 +0000
Message-ID: <179546143517.3135.4487906410015743312@kernel.org>
In-Reply-To: <20261119171021.1535172-1-irogers@google.com>
References: <20261119171021.1535172-1-irogers@google.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] In tg3_phy_reset_5703_4_5()
  (drivers/net/ethernet/broadcom/tg3.c), the patch adds an `if (err)…
- [Low] The commit message says the patch was prompted by Clang
  -Wconditional-uninitialized on phy9_orig and was verified by building…

--

tg3: Propagate PHY reset retry failures in tg3_phy_reset_5703_4_5()

This patch saves the return values of the two tg3_readphy() calls in the
tg3_phy_reset_5703_4_5() retry loop. If the loop finishes with an error,
the function now returns it. The goal is to avoid writing an uninitialized
phy9_orig back to MII_CTRL1000, and to stop treating a failed test pattern
as success.

> Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
> build. Verified by building drivers/net/ethernet/broadcom/tg3.o with
> LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
> runtime-tested on BCM5703/5704/5705 hardware.

[Severity: Low]
Will Clang still warn about phy9_orig with -Wconditional-uninitialized
after this change?

phy9_orig is still declared without an initializer:

	u32 reg32, phy9_orig;

There is still a path where every iteration takes the first continue
(the MII_TG3_EXT_CTRL read fails) before &phy9_orig is ever passed to
tg3_readphy().

Clang's uninitialized-values analysis does not link err to phy9_orig. So
the new "if (err) return err;" after the loop should not change what it
reports for this later use:

	tg3_writephy(tp, MII_CTRL1000, phy9_orig);

At runtime the patch is correct here. err == 0 after the loop can only
happen through the break, and that needs a successful MII_CTRL1000 read.

Is an explicit initializer or a restructured loop needed to silence the
warning? Or should the verification statement in the commit message be
changed?

> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> index 95827df4cf6a1..be2410e718fd9 100644
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c

[ ... ]

> @@ -2587,6 +2589,9 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
>  			break;
>  	} while (--retries);
>  
> +	if (err)
> +		return err;
> +

[Severity: High]
Can this early return leave the PHY in its test configuration?

By the time a pass reaches tg3_phy_write_and_check_testpat(), the loop
has already done the following:

- set EXT_CTRL |= 0x3000 (transmitter and interrupt disabled)
- forced MII_BMCR to 1000/full duplex
- forced MII_CTRL1000 to master
- enabled SMDSP
- blocked PHY control access:

		/* Block the PHY control access.  */
		tg3_phydsp_write(tp, 0x8005, 0x0800);

When the test pattern does not match, tg3_phy_write_and_check_testpat()
returns -EBUSY without setting *resetp. MDIO is still working at that
point:

			if (low != test_pat[chan][i] ||
			    high != test_pat[chan][i+1]) {
				tg3_writephy(tp, MII_TG3_DSP_ADDRESS, 0x000b);
				tg3_writephy(tp, MII_TG3_DSP_RW_PORT, 0x4001);
				tg3_writephy(tp, MII_TG3_DSP_RW_PORT, 0x4005);

				return -EBUSY;
			}

If that happens on all 10 retries, err is -EBUSY when the loop exits.

Before this patch, tg3_phy_reset_chanpat() overwrote err. When it
succeeded, the function went on to undo the setup:

	tg3_phydsp_write(tp, 0x8005, 0x0000);
	...
	tg3_phy_toggle_auxctl_smdsp(tp, false);

	tg3_writephy(tp, MII_CTRL1000, phy9_orig);
	...
	reg32 &= ~0x3000;
	tg3_writephy(tp, MII_TG3_EXT_CTRL, reg32);

It then returned 0, so tg3_phy_reset() also applied its out: workarounds
(ADC_BUG, 5704_A0_BUG, BER/JITTER_BUG, EXTPKTLEN, FIFO_ELASTIC, automdix,
wirespeed).

With the early return, tg3_phy_reset() now returns before it reaches the
out: label:

		err = tg3_phy_reset_5703_4_5(tp);
		if (err)
			return err;
		goto out;

Most callers ignore the return value of tg3_phy_reset(). One example is
tg3_reset_hw():

	if (reset_phy)
		tg3_phy_reset(tp);

tg3_setup_copper_phy(), the fiber and SGMII setup paths, the ethtool
self-test and tg3_set_eee() also ignore it.

Wouldn't those callers carry on with the transmitter disabled and DSP
control access still blocked?

tg3_phy_probe() does pass the error up. tg3_get_invariants() then calls
tg3_mdio_fini() and returns err, and tg3_init_one() aborts the probe.

Hardware that keeps hitting the mismatch used to be restored and keep
working. Does it now fail to probe?

Would a shared unwind path work better here? Before returning the error,
it could:

- unblock 0x8005
- turn SMDSP off
- clear EXT_CTRL 0x3000
- restore MII_CTRL1000 only if it was actually read, or do a BMCR reset

Should running out of test pattern retries be fatal at all? The commit
message also doesn't mention this change in behavior.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119171021.1535172-1-irogers%40google.com
