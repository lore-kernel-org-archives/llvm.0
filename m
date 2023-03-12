Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9384CEC3
	for <llvm@lists.linux.dev>; Sun, 12 Mar 2023 21:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678656099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LhxPivzNigfPymsS+aR3lCSkvvdVCt8SanQgM1QTFGA=;
	b=BaenfU9+5JKd5vGbd73Ycc//KS8gBba+Bvg3ERwHzPYErke7l39xAvg4qt1DB8kbs7o3ib
	gcwCfFm6/wZZ+s4IiwnJcIDnwxn9WJtijyNpcoegbcl6liPNhJByjMEvtF71w3wClyrQHe
	xLcEQNtgaiKZCEbXDp5yzjqjuRV8/ZM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-1zeenJoUPBOTTqoV1uSuTQ-1; Sun, 12 Mar 2023 17:21:37 -0400
X-MC-Unique: 1zeenJoUPBOTTqoV1uSuTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56DD385A588
	for <llvm@lists.linux.dev>; Sun, 12 Mar 2023 21:21:37 +0000 (UTC)
Received: from [172.64.2.76] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 425FD1121315;
	Sun, 12 Mar 2023 21:21:37 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (308/381 SKIPPED): Test report for master
 (6.3.0-rc1, mainline.kernel.org-clang, 13423166)
Date: Sun, 12 Mar 2023 21:21:37 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Message-Id: <40724.123031217213700185@us-mta-539.us.mimecast.lan>
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

Kernel information:
    Commit message: Merge tag 'staging-6.3-rc2' of git://git.kernel.org/pub=
/scm/linux/kernel/git/gregkh/staging

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/78090

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: Boot test: Failed to extract kernel version from the package
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1002
            Affected tests:
                 ppc64le - Boot test
                   s390x - Boot test
                  x86_64 - Boot test
                  x86_64 (debug) - Boot test



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

