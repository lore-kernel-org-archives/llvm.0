Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01C8363C77
	for <llvm@lists.linux.dev>; Mon, 13 Apr 2026 07:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776064519; cv=none; b=l+LtqKUYpMZ6UN1bPtm+2OsKxwIhr8oQug6bkaJ23KD6OwJYCZebOrzAIfT6UG8n9JFHvNatxwc4ckFv7ngyjhnEmZQPXbK6ZMQh42gHCFd1lXFrc/mDt4Vd0yqMZjmk/mBppGwHQdxunBL55v5kWGRzxUqjqb6E3K8a6c+D4LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776064519; c=relaxed/simple;
	bh=tod54RQerlnJofGfV81hsaKAzeig/oqQ1xrLxgJt+o4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMKWPmMXSL0hMcz7ZZJIHIEXTkY5CMk7RGMaOS3dJfwNNo8012J8yiBlkzxj1Ei7UMbQMkApiK9uMTPbmhJQM5kzlw9OQ7JBEMrDog3xTJTAKFIXZVWot/IpWrz/FsgkRTqcZhiYCqpbsbwADqupSdp+HZNXOgJOqFuRZYybPV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lWLMuDsV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YPZjEfIf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ry8YTLQU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ld2XamGr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lWLMuDsV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YPZjEfIf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ry8YTLQU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ld2XamGr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F32F76A88F;
	Mon, 13 Apr 2026 07:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776064516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dCHKoeJ3y61DWP9gxF2f3vF8sO5yy7UzLY7efyoo9Ng=;
	b=lWLMuDsV3sGVdosaDreo7/e/N8mkfF09Yj4bg9o9APQTzCtJiGrSaV8AFkH159p2FHTvUY
	cKmv+AUSDz1bE5e4i1qXFwChF9YapIaoe4n+M+7y9xm+eVgFrzRhipO4kxNFt+9opLIVv0
	nfQlTu+GIvA2xqCUylIe6FhJ59EZ7lE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776064516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dCHKoeJ3y61DWP9gxF2f3vF8sO5yy7UzLY7efyoo9Ng=;
	b=YPZjEfIfQlKhllmxj5cZMcS5bGqCpmDWH3arO8o4V8JRFZqe5HAzLa+HjX6D/zAPaEl3eW
	d6I+icK16kfr8UBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776064515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dCHKoeJ3y61DWP9gxF2f3vF8sO5yy7UzLY7efyoo9Ng=;
	b=Ry8YTLQUZtO4P+gQXE+Z32yX2phDAR4RDYp+8lVju+rHRpeRUixL/XX3wyKDj4NQHio939
	0Pk1LV+QqzQNvMgGroVergf6e7AEwq2f1eGWIbsRViwIsWB4gwc8cLWz0Q+rcA74G4td0x
	VayinW7GijbqKm0KGVMb9U0URj8WxiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776064515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dCHKoeJ3y61DWP9gxF2f3vF8sO5yy7UzLY7efyoo9Ng=;
	b=Ld2XamGrV9fgGZMgwXm+H2M0ptWYJ1H+PPxuIr5dBOKUcTlsuO+vmozXmZ7+8dAj2teC95
	sUg645ZRt4aQc6BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF56E4AD6E;
	Mon, 13 Apr 2026 07:15:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VT67MAOY3GkAQwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 13 Apr 2026 07:15:15 +0000
Message-ID: <497baf5d-4955-4c42-a728-104419ad658c@suse.de>
Date: Mon, 13 Apr 2026 09:15:15 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [deller-fbdev:for-next-v7.1 17/22] ERROR: modpost: "__end_rodata"
 [lib/fonts/font.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Helge Deller <deller@gmx.de>
References: <202604112326.kWhH8Y7A-lkp@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <202604112326.kWhH8Y7A-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.10 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	SUBJECT_ENDS_EXCLAIM(0.20)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmx.de];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:mid,suse.com:url,imap1.dmz-prg2.suse.org:helo,01.org:url]
X-Spam-Flag: NO
X-Spam-Score: -4.10
X-Spam-Level: 

Hi Helge

Am 11.04.26 um 17:54 schrieb kernel test robot:
> Hi Thomas,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git for-next-v7.1
> head:   26484b2fa418a002d099608e681aef86fc90990c
> commit: a76e4bfc4b3586b47ede8e83bdb6050cd6b16025 [17/22] lib/fonts: Compare font data for equality with font_data_is_equal()

This is still the old v1 or v2 of the patch.

> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604112326.kWhH8Y7A-lkp@intel.com/config)

Is it a recent warning? I'm asking because that config is for v7.0-rc2 
and hence outdated.

> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604112326.kWhH8Y7A-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604112326.kWhH8Y7A-lkp@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
>>> ERROR: modpost: "__end_rodata" [lib/fonts/font.ko] undefined!

This linker error came from the original implementation of 
font_data_is_internal(). I've fixed it in v3 of the patch at

https://lore.kernel.org/linux-fbdev/20260309141723.137364-10-tzimmermann@suse.de/

That's also the version in fbdev's for-next branch. I think we're good 
here, unless there's a way this still happens with v3.

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


