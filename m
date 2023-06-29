Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7184410784
	for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 23:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688081464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qgttsMBjOji8OJqE8kDlJmR6wULv7Js52nBL6fvQzPk=;
	b=c2Y0cKSdiCcMS3MR2xemfy08YHqx1qdVQXZm6KkNZhoSO8t106B5WnQ8Pto4J5PNAA0YO1
	1NDxkLVYcUeKjIc7hWFHE/nboGxEwS7+FHj9MgYLM+yMKRsdnivH+Io3kSgNbHh4kaVlmw
	LUsfuM4dxmTW0XKigKAZzko6voMbUGc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-1wM-lE65Pp2kdmtNZYR36w-1; Thu, 29 Jun 2023 19:31:02 -0400
X-MC-Unique: 1wM-lE65Pp2kdmtNZYR36w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E66A38117E2
	for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 23:31:02 +0000 (UTC)
Received: from [172.64.10.50] (unknown [10.30.33.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 568D840C6F5A;
	Thu, 29 Jun 2023 23:31:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0,
 mainline.kernel.org-clang, bf1fa6f1)
Date: Thu, 29 Jun 2023 23:31:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Message-Id: <07934.123062919310200367@us-mta-206.us.mimecast.lan>
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
    Commit message: Merge tag 'soc-arm-6.5' of git://git.kernel.org/pub/scm=
/linux/kernel/git/soc/soc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/94289

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36782=
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

