Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35206374
	for <llvm@lists.linux.dev>; Mon, 27 Feb 2023 01:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677461465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bs/9+aDmMR26IFhCmqFYN9p+bZ/fwHRuEp7l811gHqI=;
	b=WhrkBrbD2PpYlt+TBLKgJ6GT+iTkcBTbChzFjxZI7E9KwkcJHCt/1gEuIKDLkOj4dOi+0Z
	Jp4yEWQygnkZZYORM2s4b2hQrzYzTMrejOtNfLb3Du/1ozKM/vFKIDbC956uc9eEZDL8kk
	mfRQiyBpNeC8Ef+BzasacM/W5CEwsQQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-SfwSkE4xPwSJ9i8sf1KYQw-1; Sun, 26 Feb 2023 20:31:04 -0500
X-MC-Unique: SfwSkE4xPwSJ9i8sf1KYQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E0FC811E9C
	for <llvm@lists.linux.dev>; Mon, 27 Feb 2023 01:31:04 +0000 (UTC)
Received: from [172.64.14.61] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC8F81121314;
	Mon, 27 Feb 2023 01:31:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, f3a2439f)
Date: Mon, 27 Feb 2023 01:31:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Message-Id: <74677.123022620310400233@us-mta-319.us.mimecast.lan>
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
    Commit message: Merge tag 'rproc-v6.3' of git://git.kernel.org/pub/scm/=
linux/kernel/git/remoteproc/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/74452

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31697=
2
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31697=
3
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31697=
4
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/316976
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31697=
5

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7268135



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

