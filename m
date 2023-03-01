Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E878835
	for <llvm@lists.linux.dev>; Wed,  1 Mar 2023 19:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677699066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8kQp5f8kTeRCYqmkzyrGzEaDB+O2XUZ+4DC+IDPaTjc=;
	b=VNZS1bVvA9xqBCEY76O/5H63jFvI/quMwXSGE0qeF5O7rPPddey3PqlbGoLVDojjjZR/JA
	JOqyce4JpNqzL4QW6grHnOzalYN3f6NJdMPom/WN5uQOZD/uxErDsY6hVithbhi6wL/R5K
	w3Ga2tMN9R1Bsymiw0zXUo9AVZdD2n8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-g7NpyzR3NyiweDJr5-5nCQ-1; Wed, 01 Mar 2023 14:31:04 -0500
X-MC-Unique: g7NpyzR3NyiweDJr5-5nCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5BAB8853CE
	for <llvm@lists.linux.dev>; Wed,  1 Mar 2023 19:31:03 +0000 (UTC)
Received: from [172.64.14.37] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8629514171BA;
	Wed,  1 Mar 2023 19:31:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, 1d2aea1b)
Date: Wed, 01 Mar 2023 19:31:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Message-Id: <35309.123030114310402403@us-mta-81.us.mimecast.lan>
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
    Commit message: Merge tag 'sh-for-v6.3-tag1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/glaubitz/sh-linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/75172

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31794=
5
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31794=
6
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31794=
7
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/317949
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31794=
8


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

