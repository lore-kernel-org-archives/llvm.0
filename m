Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78295219EF
	for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 20:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691786462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HG2oogKrvacvo2ApXW76ZUvdlI9rK7AHq26RP6o0+7Q=;
	b=OXk3QAtHTBHcVCv38pM9JoDWiOPyKosabIDwAvgZzO+9xUdZs6Fw5HQcuaD4dN3HlBoeTW
	EZPePWZjrSEygdQnwp1ah+ffAm4gzo7W/74PflXObVfyrLEC7h/XZp8ELF0Wr6T5Bbe9eu
	mom+TCZIonW6lnIim33eaR9QqB2xBtI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-dwtIw2O3MQqh90jaHnmbhw-1; Fri, 11 Aug 2023 16:41:00 -0400
X-MC-Unique: dwtIw2O3MQqh90jaHnmbhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F76838008C0
	for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 20:41:00 +0000 (UTC)
Received: from [172.64.13.56] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E918C15BAE;
	Fri, 11 Aug 2023 20:41:00 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.5.0-rc5,
 mainline.kernel.org-clang, 360e6942)
Date: Fri, 11 Aug 2023 20:41:00 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <09451.123081116410001261@us-mta-312.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'block-6.5-2023-08-11' of git://git.kernel.dk=
/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/99774

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/38468=
9
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/384690


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

