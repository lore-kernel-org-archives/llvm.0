Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FFB3C0C
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 11:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660648803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/jSThLML7Q5qwKQ4XTsdXXHjTBgGcysZ4Ml3H8lGzeM=;
	b=A5xZnPIJN3QQYVUcT4iFjFSrRPIIZ8c9OxPW+a/dsqFAWl6l+bsVNwwPJT2MnMwZFrrhHS
	aUOaHh1pJ2HMZHlgyu2na79rMR/TlpjlUUN9AhNobfLaaQLLQYEbXc1ShMpKe8hwtUzc7O
	od1ZIXUzb+JbFyf/r2+gHiyK/i1bZ/U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-PsRyj_JaM16oFw4BhfVChA-1; Tue, 16 Aug 2022 07:20:02 -0400
X-MC-Unique: PsRyj_JaM16oFw4BhfVChA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C25E91C05AF7
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 11:20:01 +0000 (UTC)
Received: from [172.64.12.33] (unknown [10.30.32.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B05B49458A;
	Tue, 16 Aug 2022 11:20:01 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for 7f50d4df
 (mainline.kernel.org-clang)
Date: Tue, 16 Aug 2022 11:20:00 -0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Message-Id: <20624.122081607200200393@us-mta-398.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: OK


You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/43388

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/22593=
5

One or more kernel tests failed:

    We also see the following known issues which are not related to your ch=
anges:
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                  x86_64 (debug) - kselftest build - net
                  x86_64 (debug) - kselftest build - bpf


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

