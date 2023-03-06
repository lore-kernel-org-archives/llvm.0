Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D5F53A6
	for <llvm@lists.linux.dev>; Mon,  6 Mar 2023 23:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678144809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MoGchFW1NyJLI6NT15xjFsBLfkgFqLWiMVD6UKvdJL0=;
	b=PFIxJOSFjlOSiVpiTToXREnPgnxfti/UYyRO/Npk4XutDrjxr04RwRaNwEc0cXH/CzAsOQ
	G650mdBZcU08spaNaqnbUhrPR8q72NbPmLxwP+CNhMsCPEbz5bHNVb8DpRp75ugm9ZMU4B
	k80qQ1shlZi6mIcsP4RAXqjVTaSCBco=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-vyDI3ET4PTqCAK7fyzCsHg-1; Mon, 06 Mar 2023 18:20:07 -0500
X-MC-Unique: vyDI3ET4PTqCAK7fyzCsHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 952CD3C0E444
	for <llvm@lists.linux.dev>; Mon,  6 Mar 2023 23:20:07 +0000 (UTC)
Received: from [172.64.2.76] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FC36C16029;
	Mon,  6 Mar 2023 23:20:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master
 (6.3.0-rc1, mainline.kernel.org-clang, 8ca09d5f)
Date: Mon, 06 Mar 2023 23:20:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <81811.123030618200700912@us-mta-502.us.mimecast.lan>
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
    Commit message: cpumask: fix incorrect cpumask scanning result checks

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/76547

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31977=
4
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31977=
5
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31977=
6
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/319778
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31977=
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

