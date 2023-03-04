Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5902815B8
	for <llvm@lists.linux.dev>; Sat,  4 Mar 2023 02:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677895208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O4BabruNAWav50zlwvWty8p/j2mchf9rkdMx1N7ZDTk=;
	b=AaZ65aVds1KfTgQHK2Fg1zBBd2sndwtTgHP6xjdfhy4Uu7ImGxoFbB+cST0yHgnG8kU5xC
	xkcQe3w5Uus9tlBI7itTF5FLWXJkXbkn/NGuiNhXIb4ELMGbFXrU1w7CqMLae8Pn7dLSon
	T0Y5974oa2eHFLyJlGgIIDYUK6irBFs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-yQwWLYklONODBYxCsaSEpQ-1; Fri, 03 Mar 2023 21:00:06 -0500
X-MC-Unique: yQwWLYklONODBYxCsaSEpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37CB029AB3E2
	for <llvm@lists.linux.dev>; Sat,  4 Mar 2023 02:00:06 +0000 (UTC)
Received: from [172.64.0.76] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FF67440D8;
	Sat,  4 Mar 2023 02:00:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, 0988a0ea)
Date: Sat, 04 Mar 2023 02:00:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Message-Id: <82225.123030321000600447@us-mta-50.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: OK


Kernel information:
    Commit message: Merge tag 'for-v6.3-part2' of git://git.kernel.org/pub/=
scm/linux/kernel/git/sre/linux-power-supply

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/75971

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31924=
6
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31924=
7
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31924=
8
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/319250
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31924=
9


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

