Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53CB11700
	for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 21:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691788265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pve6MxOuQBbPy0ZACfV/aq7ZgFlAxwUXPVw88sHIl9Q=;
	b=Q+fDiczH6BoxqtJ0eLuMVYD57Aom1RUFJ5Mm23ZO6qQLlcP5Xk/d2thLsrzVhM6nRLQq2c
	1MDFJfrF1NkeaFY957rn4uqWK2XUlos0tMCWRPSIE0dSvotwkgYObjzOLQPOql506sQLwc
	pjiRS097Wje2zkxojZvY8SKFYdIenBQ=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-t8PHcuetPl-xoITx23AvwQ-1; Fri, 11 Aug 2023 17:11:04 -0400
X-MC-Unique: t8PHcuetPl-xoITx23AvwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E92073C14AA8
	for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 21:11:03 +0000 (UTC)
Received: from [172.64.13.56] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D370E40C2063;
	Fri, 11 Aug 2023 21:11:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.5.0-rc5,
 mainline.kernel.org-clang, 29d99aae)
Date: Fri, 11 Aug 2023 21:11:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <49856.123081117110401326@us-mta-636.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'acpi-6.5-rc6' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/99784

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/38472=
2
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/384723


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

