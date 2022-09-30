Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07BE5A7C
	for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 17:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664559613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q2DYdI9Fbcp+VNLLLnYgb+cvI1OPnzynjY+HeeV87po=;
	b=cAmOYTsuji8D+WXwrRGtRn/NgxgM2mflK2iWw87aiVL76zbnyYQBpujy7ROzEQQehkk+Cf
	cwgUqgrJ9EoyJ4cYswNuXVlUiP9ZbOFhWcq3m+yKyqUiePbEja8uUoa9TzzMFkMpA0MS4N
	ZEr2qtSm2NKNAEFa2V/+XyZzR/oTZl4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-RvXIcuIAMb2m9SFabpmqrg-1; Fri, 30 Sep 2022 13:40:11 -0400
X-MC-Unique: RvXIcuIAMb2m9SFabpmqrg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6001A81B149
	for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 17:40:11 +0000 (UTC)
Received: from [172.64.4.38] (unknown [10.30.34.212])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 414BA492CA4;
	Fri, 30 Sep 2022 17:40:11 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.0.0-rc7,
 mainline.kernel.org-clang, 5a773869)
Date: Fri, 30 Sep 2022 17:40:09 -0000
CC: jdoe@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Message-Id: <50018.122093013401100940@us-mta-400.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'drm-fixes-2022-09-30-1' of git://anongit.fre=
edesktop.org/drm/drm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/54798

One or more kernel tests failed:

    Unrecognized or new issues:
         aarch64 - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319180
         aarch64 - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319181
         ppc64le - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319187
         ppc64le - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319188
           s390x - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319159
           s390x - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319160
          x86_64 - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319173
          x86_64 - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319174
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319132
          x86_64 (debug) - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319166
          x86_64 (debug) - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319167



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

