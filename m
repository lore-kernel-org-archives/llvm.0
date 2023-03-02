Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF16A938
	for <llvm@lists.linux.dev>; Thu,  2 Mar 2023 20:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677787267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ngRAbWVx1zrBf3DONv4mVWkiIaZg+ktGV+VGst/RQqI=;
	b=SuZWdBGwQ2lnC7jKfNXVt0ZfOGHFvGbq9NtfdfQb2X8X1+LWv5FSTCPYF1IHSHnzbak7EX
	GiB+iPM61Umr7rjH6A8FMoYMe0SvwrQkAPWwIy9h9SMj7Lwg0Hb/6lEiY7cujffA7k/VrV
	pUgjPtMSOFsgMN7aiUB3XO0TRSOtiLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-JJsBP8KYPx2Q3sdBCKzrcw-1; Thu, 02 Mar 2023 15:01:06 -0500
X-MC-Unique: JJsBP8KYPx2Q3sdBCKzrcw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 578F218E6C5A
	for <llvm@lists.linux.dev>; Thu,  2 Mar 2023 20:01:05 +0000 (UTC)
Received: from [172.64.14.37] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40E4F140EBF6;
	Thu,  2 Mar 2023 20:01:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, 857f1268)
Date: Thu, 02 Mar 2023 20:01:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Message-Id: <64425.123030215010601599@us-mta-612.us.mimecast.lan>
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
    Commit message: Merge tag 'objtool-core-2023-03-02' of git://git.kernel=
.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/75502

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31845=
0
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31845=
1
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31845=
2
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/318454
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31845=
3


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

