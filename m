Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778A71E50B
	for <llvm@lists.linux.dev>; Wed, 10 May 2023 23:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683760866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8tcI9o5QIpTi2mN9kQu07mHuqeOh5tQl//vlyb5uj8E=;
	b=PwNIzNGeXeYLXZlI1PMTz2swfPwPetwHYxBAanX0N8BkwS/PwEFp+9Dxl1wQpqp+xrjoDM
	Y6iXJQjx2xcEJQQGTsIMdrCRXvj8WauHaK+k0aQ/KUIYvHb9w+IBdEgpCM7ltIPSfO4bO3
	e5gHAtnatHCcePG9oq6C8DdePfFKwC0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-UyumP6yNMcaAgdHQnLMJbQ-1; Wed, 10 May 2023 19:21:05 -0400
X-MC-Unique: UyumP6yNMcaAgdHQnLMJbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 338B81854CA2
	for <llvm@lists.linux.dev>; Wed, 10 May 2023 23:21:04 +0000 (UTC)
Received: from [172.64.2.74] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F404C15BA0;
	Wed, 10 May 2023 23:21:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc1,
 mainline.kernel.org-clang, d295b66a)
Date: Wed, 10 May 2023 23:21:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <12669.123051019210500781@us-mta-85.us.mimecast.lan>
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
    Commit message: Merge tag 'fsnotify_for_v6.4-rc2' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/jack/linux-fs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/88434

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/34861=
5


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

