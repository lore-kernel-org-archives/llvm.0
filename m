Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20C67C
	for <llvm@lists.linux.dev>; Fri, 24 Jun 2022 08:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656059487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j7WqdwNTHHGU1OQ31FT3vZEqXOoEELhKS+A0NiQrYOk=;
	b=T2svUY2zSj13mtkhuYFHjYXH1v7KrurfQGHx0WNXkDZYdFP0ybn8KvREYQApfVJaEPhgr1
	/GCW0/vHAk/UbYwC+p6Ym5lSzPCHobE2MBrBITzbyrC6U5ASBfZOu64soO7NOXsr/H8Ich
	0CczKUhzgqG6c8DgAAkLpfdrWrOtjU8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-Kg9q9e2lPXq3qfe2QM-QWA-1; Fri, 24 Jun 2022 04:31:25 -0400
X-MC-Unique: Kg9q9e2lPXq3qfe2QM-QWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3921229324A8
	for <llvm@lists.linux.dev>; Fri, 24 Jun 2022 08:31:25 +0000 (UTC)
Received: from [172.64.0.95] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2898B2166B26;
	Fri, 24 Jun 2022 08:31:25 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4pyF?= PASS: Test report for 92f20ff7
 (mainline.kernel.org-clang)
Date: Fri, 24 Jun 2022 08:31:24 -0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Message-Id: <48898.122062404312500361@us-mta-139.us.mimecast.lan>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cki-project@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

One or more kernel tests failed:

    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - kselftest build - net
                   Issue: kselftest build - net: /usr/include/gnu/stubs.h:7=
:11: fatal error: 'gnu/stubs-32.h' file not found
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1222
                   Issue: gcc: error: unrecognized command-line option =E2=
=80=98-Qunused-arguments=E2=80=99
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/513
          x86_64 - kselftest build - bpf
                   Issue: kselftest build - net: /usr/include/gnu/stubs.h:7=
:11: fatal error: 'gnu/stubs-32.h' file not found
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1222
                   Issue: gcc: error: unrecognized command-line option =E2=
=80=98-Qunused-arguments=E2=80=99
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/513


You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/46114

If you find a failure unrelated to your changes, please tag it at https://d=
atawarehouse.cki-project.org .
This will prevent the failures from being incorrectly reported in the futur=
e.
If you don't have permissions to tag an issue, you can contact the CKI team=
 or
test maintainers.

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

