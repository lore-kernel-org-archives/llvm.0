Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E87E4A3B
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 20:54:13 +0000 (UTC)
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27MKocHd027335
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 16:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type : content-transfer-encoding; s=pps01;
 bh=Mo8sb9Iedj8/VdO/SEttnMUVmZS2+A3c4OZ9QqF18mQ=;
 b=IYB2OReoAW8/QxkoYNcm2sBfZON8LQtMvSnyjaN4/yPMGrn+zMfvh54bYxD5ed7VMpi+
 fGCoEXFC3+UCdD2sPLPsZO2UFEaNkww1vVe9AvocjYXoJEgutP5LI7OojGOwqD52LV66
 8PJ71+TTg9u4hh1CZQdC7EJfULiGsMOpIQWrIkZWDwdFJXYH9TzpyCe9TsP4U6TpOBma
 BEOvUJQIAFcU60q5UXGF2M+3b98X2iOK++RRH+LP20+o5/5vqbkby2jnsFM2G61bONiV
 ud7wTWNhRy74fdQdKSnMnBTz6qPBLaegJ3LtowCa/C/vTPt3Z0noa0azYlabhJO6M2rO Sg== 
Received: from sendprdmail21.cc.columbia.edu (sendprdmail21.cc.columbia.edu [128.59.72.23])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 3j4fqcrnja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 16:54:07 -0400
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by sendprdmail21.cc.columbia.edu (8.14.7/8.14.4) with ESMTP id 27MKs6J5013083
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 16:54:06 -0400
Received: by mail-ua1-f69.google.com with SMTP id 95-20020a9f23e8000000b0038caa7cd5c1so2485475uao.8
        for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 13:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=Mo8sb9Iedj8/VdO/SEttnMUVmZS2+A3c4OZ9QqF18mQ=;
        b=qtJopEuPWIzz8hpeIYKDodbLsiTGNeaURBtFTltd2CsdrPWC41/IjGHg8P8MoC7eCT
         BsNZNQ9ikFzRhSXqBAdUdOZk+97xVtTWn7DsNIXpHm8C8uOay+nlxZY6utoo6gUVhsRo
         DYeE82mZJs46ZjMwISF8lxQc/PzVKwZuYNvVf6y7pIoB+gJAKTb6zR+6kSJsJ3365vAX
         nWxGEOrYMwntx2tenE6BmHZOk1yxhkBLvv4yT2jAKOFKt6It9sLizFIH1OqzO06yOE7q
         YTM8XgbJuiMaUrgDHp869h8rQ8/zXnJoL3jMEZvxexhh9IlhcLhFAEL62Sjyv8V9HU3n
         +3YQ==
X-Gm-Message-State: ACgBeo0EVwdJgv5UAi9qNzIL6K3bUpLn6/a1j+q6JWz9Os3hqEPdI6q9
	7+M7AZsK+CL4INwtpHOhi5DJOZuYJgtQxF+ghuZR2MWwVrE46PzaMel1IH3iXnMkgcRhLaWOVlD
	5YOfP6mDJ+X/UNAnhJ96k0TP2FQODo6PuD4U1Mw==
X-Received: by 2002:a67:d284:0:b0:390:3f27:a274 with SMTP id z4-20020a67d284000000b003903f27a274mr4415261vsi.12.1661201645100;
        Mon, 22 Aug 2022 13:54:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6NjecVC7q0XYguex/4+KoZJIW4YqcaBN4i5IohL13E0ok2VmGJpinv8mEj+Weg1cPvOmVpHEoakTrqhLkfAcI=
X-Received: by 2002:a67:d284:0:b0:390:3f27:a274 with SMTP id
 z4-20020a67d284000000b003903f27a274mr4415241vsi.12.1661201644854; Mon, 22 Aug
 2022 13:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEHB24_nMMdHw1tQ0Jb0rhOLXgi6X=_Ou6r8BcbV3r-6HeueEA@mail.gmail.com>
 <CANn89iK2O_-m3KUooE8TUOupYZwXAjfrV64bhS0UAn8hFZVdgw@mail.gmail.com>
In-Reply-To: <CANn89iK2O_-m3KUooE8TUOupYZwXAjfrV64bhS0UAn8hFZVdgw@mail.gmail.com>
From: Gabriel Ryan <gabe@cs.columbia.edu>
Date: Mon, 22 Aug 2022 16:53:58 -0400
Message-ID: <CALbthtc5ptO8VySp+TGqQU8SCU1AXQooOD+LqSUQi8-NbJLFdA@mail.gmail.com>
Subject: Re: data-race in __tcp_alloc_md5sig_pool / tcp_alloc_md5sig_pool
To: Eric Dumazet <edumazet@google.com>
Cc: abhishek.shah@columbia.edu, David Miller <davem@davemloft.net>,
        David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        netdev <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        John Fastabend <john.fastabend@gmail.com>,
        Martin KaFai Lau <kafai@fb.com>, KP Singh <kpsingh@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, Song Liu <songliubraving@fb.com>,
        trix@redhat.com, Yonghong Song <yhs@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: NWBMd4HBoBDXVt-48Xyz0MeTOR4jusJf
X-Proofpoint-GUID: NWBMd4HBoBDXVt-48Xyz0MeTOR4jusJf
X-CU-OB: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_12,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=10 phishscore=0 mlxlogscore=732 priorityscore=1501
 bulkscore=10 clxscore=1011 mlxscore=0 lowpriorityscore=10 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220083

Hi Eric,

Makes sense, thanks for taking the time to look at our report.

Best,

Gabe



On Fri, Aug 19, 2022 at 5:24 PM Eric Dumazet <edumazet@google.com> wrote:
>
> On Fri, Aug 19, 2022 at 8:40 AM Abhishek Shah
> <abhishek.shah@columbia.edu> wrote:
> >
> > Hi all,
> >
>
> Not sure why you included so many people in this report ?
>
> You have not exactly said what could be the issue (other than the raw
> kcsan report)
>
> > We found a race involving the tcp_md5sig_pool_populated variable. Upon =
further investigation, we think that __tcp_alloc_md5sig_pool can be run mul=
tiple times before tcp_md5sig_pool_populated is set to true here. However, =
we are not sure. Please let us know what you think.
>
> I think this is a false positive, because the data race is properly handl=
ed
> with the help of tcp_md5sig_mutex.
>
> We might silence it, of course, like many other existing data races.
>
>
>
> >
> > Thanks!
> >
> >
> > --------------------Report--------------
> >
> > write to 0xffffffff883a2438 of 1 bytes by task 6542 on cpu 0:
> >  __tcp_alloc_md5sig_pool+0x239/0x260 net/ipv4/tcp.c:4343
> >  tcp_alloc_md5sig_pool+0x58/0xb0 net/ipv4/tcp.c:4352
> >  tcp_md5_do_add+0x2c4/0x470 net/ipv4/tcp_ipv4.c:1199
> >  tcp_v6_parse_md5_keys+0x473/0x490
> >  do_tcp_setsockopt net/ipv4/tcp.c:3614 [inline]
> >  tcp_setsockopt+0xda6/0x1be0 net/ipv4/tcp.c:3698
> >  sock_common_setsockopt+0x62/0x80 net/core/sock.c:3505
> >  __sys_setsockopt+0x2d1/0x450 net/socket.c:2180
> >  __do_sys_setsockopt net/socket.c:2191 [inline]
> >  __se_sys_setsockopt net/socket.c:2188 [inline]
> >  __x64_sys_setsockopt+0x67/0x80 net/socket.c:2188
> >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> >  do_syscall_64+0x3d/0x90 arch/x86/entry/common.c:80
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >
> > read to 0xffffffff883a2438 of 1 bytes by task 6541 on cpu 1:
> >  tcp_alloc_md5sig_pool+0x15/0xb0 net/ipv4/tcp.c:4348
> >  tcp_md5_do_add+0x2c4/0x470 net/ipv4/tcp_ipv4.c:1199
> >  tcp_v4_parse_md5_keys+0x42f/0x500 net/ipv4/tcp_ipv4.c:1303
> >  do_tcp_setsockopt net/ipv4/tcp.c:3614 [inline]
> >  tcp_setsockopt+0xda6/0x1be0 net/ipv4/tcp.c:3698
> >  sock_common_setsockopt+0x62/0x80 net/core/sock.c:3505
> >  __sys_setsockopt+0x2d1/0x450 net/socket.c:2180
> >  __do_sys_setsockopt net/socket.c:2191 [inline]
> >  __se_sys_setsockopt net/socket.c:2188 [inline]
> >  __x64_sys_setsockopt+0x67/0x80 net/socket.c:2188
> >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> >  do_syscall_64+0x3d/0x90 arch/x86/entry/common.c:80
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >
> > Reported by Kernel Concurrency Sanitizer on:
> > CPU: 1 PID: 6541 Comm: syz-executor2-n Not tainted 5.18.0-rc5+ #107
> > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04=
/01/2014
> >
> >
> > Reproducing Inputs
> >
> > Input CPU 0:
> > r0 =3D socket(0xa, 0x1, 0x0)
> > setsockopt$inet_tcp_TCP_MD5SIG(r0, 0x6, 0xe, &(0x7f0000000000)=3D{@in6=
=3D{{0xa, 0x0, 0x0, @private0}}, 0x0, 0x0, 0x10, 0x0, "a04979dcb0f6e3666c36=
f59053376c1d2e245fbad5b4749a8c55dda1bd819ec87afb7f5ac2483f179675d3c23fdba66=
1afcca7cca5661a7b52ac11cc8085800c2c0d8e7de309eb57b89292880a563154"}, 0xd8)
> > setsockopt$inet_tcp_TCP_MD5SIG(r0, 0x6, 0xe, &(0x7f0000000100)=3D{@in6=
=3D{{0xa, 0x0, 0x0, @loopback}}, 0x0, 0x0, 0x28, 0x0, "f386ea32b026420a2c65=
ea375667090000000000000000a300001e81f9c22181fe9cef51a4070736c7a33d08c1dd5c3=
5eb9b0e6c6aa490d4f1b18f7b09103bf18619b49a9ce10f4bd98e0b00"}, 0xd8)
> >
> > Input CPU 1:
> > r0 =3D socket$inet_tcp(0x2, 0x1, 0x0)
> > setsockopt$inet_tcp_TCP_MD5SIG(r0, 0x6, 0xe, &(0x7f0000000080)=3D{@in=
=3D{{0x2, 0x0, @remote}}, 0x0, 0x0, 0x47, 0x0, "2a34e559cc66f8b453edeb61450=
c3899cc1d1304f0e5f1758293ddd3597b84447d3056ed871ae397b0fd27a54e4ff8ba83f0cf=
3e5f323acb74f974c0b87333e0570e9019d8fdcf0bc1044a5e96d68296"}, 0xd8)
