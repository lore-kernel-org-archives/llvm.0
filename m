Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8361A3F
	for <llvm@lists.linux.dev>; Wed, 27 Jul 2022 05:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658898116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jReBGluUeHDisBKrE67cviYpJumWILn+jXOUQjX0wMQ=;
	b=CdO/B2w/iXee+bhKxfLVZd2MQplQ4lmOAuSsXgEldyLZGhyitQ86CMUI8R+13twMMkDH11
	kUQbVa95hPRdThCvUIAs4mKRoowi/THrLfhnCe9hlIpyuX8mT6LGT8OnARAzRUHr3LMc9a
	8XsW6F+QpAJCVN2CbQ2FiUF8VmpPZA8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-JgESh6UFNsCZi0yRReerww-1; Wed, 27 Jul 2022 01:01:55 -0400
X-MC-Unique: JgESh6UFNsCZi0yRReerww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 299363C01E1C
	for <llvm@lists.linux.dev>; Wed, 27 Jul 2022 05:01:55 +0000 (UTC)
Received: from [172.64.0.89] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 195D62026D64;
	Wed, 27 Jul 2022 05:01:55 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4pyF?= PASS (415/492 SKIPPED): Test report for 5.19.0-rc8
 (mainline.kernel.org-clang) [39c3c396]
Date: Wed, 27 Jul 2022 05:01:54 -0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Message-Id: <15737.122072701015500343@us-mta-199.us.mimecast.lan>
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

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/48908

One or more kernel tests failed:

    We also see the following known issues which are not related to your ch=
anges:
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
        Issue: kselftest build: /usr/include/gnu/stubs.h:7:11: fatal error:=
 'gnu/stubs-32.h' file not found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1222
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
        Issue: Boot test: Failed to extract kernel version from the package
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1002
            Affected tests:
                 aarch64 - Boot test
                 ppc64le - Boot test
                   s390x - Boot test
                  x86_64 - Boot test
                  x86_64 (debug) - Boot test


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

