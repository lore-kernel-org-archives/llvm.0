Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B9610E3;
	Sun, 15 Jan 2023 20:09:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1673813364; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mh8JvhAsM7Bp1HlpvdNfDQMrCcjr/SYYm3oeKfUsOB6kZqWcxIJuWsBXCZyBRQLID5Oal9ob3MQyxcDq3aQ+PnFGFetnrzhq5QAjzpR2KL1heMyxphYFxsd4nJQ6CzDkGrVwa+KSvYp6EK4a2kWeIf6ORaAss2j2issV6S9vp5k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1673813364; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=5BFWu9NnwmQV17YSQ0tDpZgMgMY1LKL2piLUxJoLmzo=; 
	b=MA2z8npOQ73NpbjjCx7+CSTmZR6aO9a7XzXFO4mNHJKu5OwI6ptIDwgm2lUVCLEDhj4TxiSz0XoQTHI1JIv09/+pmJlDihuiAp27nAjoVh951AX3tX4sWwtcbhvdhC0QsQ14qwlGq4s6VUj+/DVDPBvNH+42t+9G0E7nq00Ek78=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1673813364;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5BFWu9NnwmQV17YSQ0tDpZgMgMY1LKL2piLUxJoLmzo=;
	b=GxyNG1PTLlBm8fKKjaeYtZdBcO2xUPjXbz4zKUeW464B7noTBzT8gLY/KD5bKsJa
	xeL1S9gL3KzTqTOoz1V2OIqH5qnM1/uy165HJXJ0saVV1lQ4kBix6RPStW7gcMTmXpw
	oFVtxkTYUADpqKH7mTeq4oHueKmhQfCTxksUf42A=
Received: from [10.10.10.218] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1673813362099729.7478386148782; Sun, 15 Jan 2023 12:09:22 -0800 (PST)
Message-ID: <f250146b-7daf-86c3-f5e6-b98ed497eef7@arinc9.com>
Date: Sun, 15 Jan 2023 23:09:19 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [stable:linux-5.15.y 1642/9999] ERROR: Input tree has errors,
 aborting (use -f to force output)
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>
References: <202301150959.RAvfuBjG-lkp@intel.com>
 <aa73cfb8-99ed-20b4-071c-9858399aee0a@arinc9.com>
 <CAMhs-H_fykbcZjSQ0LKOmtWMLjekDgUHsJjNNqSvYvbY=wbkHQ@mail.gmail.com>
 <Y8QKQ1XKEZvtmJYc@kroah.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Y8QKQ1XKEZvtmJYc@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 15.01.2023 17:14, Greg Kroah-Hartman wrote:
> On Sun, Jan 15, 2023 at 01:52:58PM +0100, Sergio Paracuellos wrote:
>> On Sun, Jan 15, 2023 at 10:05 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>>
>>> Sergio, this issue hasn't seem to gone away. If you haven't sent the
>>> patch you mentioned here [1], I think Greg taking your upstream commit
>>> [2] to 5.15.y tree would be the easiest solution.
>>>
>>> [1]:
>>> https://lore.kernel.org/all/CAMhs-H8BLheXBc+BcDH_PKmDg+_bWF9OmiS_grw1mO+RxW+J8Q@mail.gmail.com/
>>> [2]:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/drivers/staging/mt7621-dts/mt7621.dtsi?id=ce835dbd04d7b24f9fd50d9a9c59be46304aaa8a
>>
>> I forgot I sent [2] at some point :). Yes, taking directly that patch
>> sounds easier.
> 
> <formletter>
> 
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>      https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.
> 
> </formletter>

Should I do this one if you're busy Sergio? If you'd like to instead, I 
guess you should also add the bot's Reported-by.

Arınç
