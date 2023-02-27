Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A8033C5
	for <llvm@lists.linux.dev>; Mon, 27 Feb 2023 23:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677540607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TD+Xdxk1CZP1b1weRsT+pTboOaysy8H7IDtzh8e/qoM=;
	b=Y2AnWb8xVVVb3CPEeIbuPwohi3SP/4nA7F+33buJ6mNMBwOHBRFnsDQGdzFVbLLqIYWbfW
	Aeb4pg0PR5+fhVzJmH44Nkw5GXnyBrWMTRWBI24anTpNK7tLr8ZRMSSHfOP9Jno9bem7nU
	hONfohSkcPe+T+uayW2T99vxEh+Vqyc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-GQ3qtdV5MRuK28sAZYn0YA-1; Mon, 27 Feb 2023 18:30:06 -0500
X-MC-Unique: GQ3qtdV5MRuK28sAZYn0YA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C6C0185A794
	for <llvm@lists.linux.dev>; Mon, 27 Feb 2023 23:30:06 +0000 (UTC)
Received: from [172.64.13.54] (unknown [10.30.33.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 580954047024;
	Mon, 27 Feb 2023 23:30:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, 5ca26d60)
Date: Mon, 27 Feb 2023 23:30:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <34813.123022718300601151@us-mta-262.us.mimecast.lan>
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
    Commit message: Merge tag 'net-6.3-rc1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/74698

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31733=
6
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31733=
7
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31733=
8
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/317340
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31733=
9

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7276158



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

