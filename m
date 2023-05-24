Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC74EC2
	for <llvm@lists.linux.dev>; Wed, 24 May 2023 03:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684899067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oLMsNg+mXEVntyGg5LiOujN6vqzbGgb9i0i9dvZnS/s=;
	b=fwO1i5dmEC9PJ1adscVY0aPYrZUayeu1usU2jYa9emsm1AarrXG+N5+0eAk76tMZD4uhiV
	MDl9xv/mMAVpfnfjDnnvpHm+itBc62XjEXo3EnkSxvH45G24KWi/y3zzi3gKtkH+vxoatV
	lz1Q7eSf4pjXAXEJwACukoU68XSD0S4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-FiIzu4mxPda6-6olbCAPUA-1; Tue, 23 May 2023 23:31:05 -0400
X-MC-Unique: FiIzu4mxPda6-6olbCAPUA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 598781C06EC2
	for <llvm@lists.linux.dev>; Wed, 24 May 2023 03:31:05 +0000 (UTC)
Received: from [172.64.14.43] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C16A7AF5;
	Wed, 24 May 2023 03:31:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc3,
 mainline.kernel.org-clang, 9d646009)
Date: Wed, 24 May 2023 03:31:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Message-Id: <44476.123052323310500227@us-mta-674.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: SKIPPED


Kernel information:
    Commit message: Merge tag 'tpmdd-v6.4-rc4' of git://git.kernel.org/pub/=
scm/linux/kernel/git/jarkko/linux-tpmdd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/89995

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/35373=
7


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

