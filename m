Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305D3628
	for <llvm@lists.linux.dev>; Thu,  9 Mar 2023 01:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678324254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=40pzBjf7eG8i3JB8bPjLCUztMpReO4ypBZAJDN0S2C4=;
	b=ib4IesjTfzi/gOev1FYu3E3dHim0kO1fqS/LroVpDHdhNdTMCHd+cDBw17+ZppwLk4HCSt
	RwIwSR3y9tUIGhlnEgTPT1Vcav8gJzRwylaKYgkUXvu0KAfLpIMLPISUGPvhrrZOTaTYkl
	1rT8Q+Xp3Ea3/wvk2M+eY4XAQZSNkWU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-lx7jxST4PwCppdVT_xfzcw-1; Wed, 08 Mar 2023 20:10:52 -0500
X-MC-Unique: lx7jxST4PwCppdVT_xfzcw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B9A33850549
	for <llvm@lists.linux.dev>; Thu,  9 Mar 2023 01:10:52 +0000 (UTC)
Received: from [172.64.2.76] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E68940C83B6;
	Thu,  9 Mar 2023 01:10:52 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (308/381 SKIPPED): Test report for master
 (6.3.0-rc1, mainline.kernel.org-clang, 6a98c9ca)
Date: Thu, 09 Mar 2023 01:10:52 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <11687.123030820105200585@us-mta-539.us.mimecast.lan>
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
    Commit message: Merge tag 'fs_for_v6.3-rc2' of git://git.kernel.org/pub=
/scm/linux/kernel/git/jack/linux-fs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/77132

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

