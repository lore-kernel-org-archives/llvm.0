Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8BB7E1
	for <llvm@lists.linux.dev>; Tue, 28 Feb 2023 04:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677558008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y0g4kK64lReTB7X0ZdNmrYDrFwSS4m/NufqIhsgGKXQ=;
	b=LCkqQY9RZMvbqbnaHH1dePOEmk0xJi5upl0HZeDK46ObKRl1+G9ejAtqr1H/QXGkLDdYYF
	PQ7WwzyYjX3IJjEdHqdyq2oWvwRuT/mmR+3E/oSW+VMuXqOCIapMn+nQrgBQy44on8dEG7
	eQOuy4nMkam9yGV41H183pSMdWSGQLE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-KQw4tI6IMbeCrNfN7nrS2A-1; Mon, 27 Feb 2023 23:20:04 -0500
X-MC-Unique: KQw4tI6IMbeCrNfN7nrS2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E9B03806710
	for <llvm@lists.linux.dev>; Tue, 28 Feb 2023 04:20:04 +0000 (UTC)
Received: from [172.64.13.54] (unknown [10.30.33.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E5A4140EBF4;
	Tue, 28 Feb 2023 04:20:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, ae3419fb)
Date: Tue, 28 Feb 2023 04:20:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Message-Id: <67587.123022723200401356@us-mta-516.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: FAILED


Kernel information:
    Commit message: vc_screen: don't clobber return value in vcs_read

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/74751

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31741=
8
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31741=
9
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31742=
0
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/317422
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31742=
1

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7277180



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

