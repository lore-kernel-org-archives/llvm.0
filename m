Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39523623
	for <llvm@lists.linux.dev>; Tue, 28 Feb 2023 02:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677551406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IFezsrapTSfdWqHjpFAnDwPcL0Bwvh3sqv8RuHXFKAU=;
	b=ZeatYhlVOrvz6IruG8px6w+p7yHRBWudIsvOGahwykCgx+cAtyZYh4mvlFV8kl50tyC0vT
	vou9RhfTw5leEmEI8FuUvnhfoIqDgbcXjq+E0WCoBywH77/OIyfGFJv3Wn6Yu8EpKzTBDx
	HVxy03MKI2fgrUUygvyZ8wzU4SC3XYE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-Y5xTrzvsO0GG2V_p0esoeA-1; Mon, 27 Feb 2023 21:30:05 -0500
X-MC-Unique: Y5xTrzvsO0GG2V_p0esoeA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58C0629AB3E4
	for <llvm@lists.linux.dev>; Tue, 28 Feb 2023 02:30:05 +0000 (UTC)
Received: from [172.64.13.54] (unknown [10.30.33.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4533E140EBF4;
	Tue, 28 Feb 2023 02:30:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, 981ee95c)
Date: Tue, 28 Feb 2023 02:30:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Message-Id: <46826.123022721300500903@us-mta-648.us.mimecast.lan>
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
    Commit message: vfs: avoid duplicating creds in faccessat if possible

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/74736

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31739=
8
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31739=
9
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31740=
0
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/317402
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31740=
1

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7276570



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

